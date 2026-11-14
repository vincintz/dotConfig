/**
 * Safety Guard Extension
 *
 * Enforces the plan-first, git-aware, and destructive-command rules from
 * ~/.pi/agent/AGENTS.md and APPEND_SYSTEM.md. Prompt rules are advisory; this
 * extension is the enforcement layer for tool calls.
 *
 * Gates:
 *  - Plan gate: write/edit (and mutating bash) blocked until the user sends
 *    exactly "APPROVE PLAN". Exceptions: documentation files, or /small on
 *    (unless "PLAN REQUIRED" was sent).
 *  - Git gate: write/edit require cwd to be inside a git work tree. Outside git,
 *    the user must confirm.
 *  - Destructive gate: rm -r/-rf, git reset --hard, git clean -f, terraform
 *    apply/destroy, kubectl delete, aws cloudformation delete-stack,
 *    az group delete, gcloud projects delete all require confirmation.
 *    Without a UI they are blocked.
 *
 * Approval modes (default: auto on every load):
 *  - auto: plan gate skipped. Writes/edits are hard-blocked unless the target is
 *    inside a git work tree; mutating shell commands are hard-blocked when cwd is
 *    not in a git repo. Destructive gate still applies.
 *  - manual: plan gate as described above; outside-git edits ask for confirmation.
 *
 * Commands: /safe (show settings, "/safe reset"), /small (on|off), /approval (auto|manual)
 */

import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";
import { existsSync } from "node:fs";
import { dirname, resolve } from "node:path";

type ApprovalMode = "auto" | "manual";

interface GateState {
	mode: ApprovalMode; // auto: no APPROVE PLAN needed, git-only writes enforced
	approved: boolean; // user sent "APPROVE PLAN" this session
	planRequired: boolean; // user sent "PLAN REQUIRED": disables all exceptions
	smallChange: boolean; // /small on: non-doc writes allowed without approval
}

const DOC_FILE = /\.(md|txt|adoc|rst)$/i;

const DESTRUCTIVE_RULES: ReadonlyArray<{ label: string; test: (segment: string) => boolean }> = [
	{ label: "rm -r / rm -rf", test: isRecursiveRm },
	{ label: "git reset --hard", test: (s) => /\bgit\s+reset\b.*--hard\b/.test(s) },
	{ label: "git clean -f / -fd", test: (s) => /\bgit\s+clean\b.*(\s-[a-zA-Z]*f|--force)/.test(s) },
	{ label: "terraform destroy", test: (s) => /\bterraform\s+destroy\b/.test(s) },
	{ label: "terraform apply", test: (s) => /\bterraform\s+apply\b/.test(s) },
	{ label: "kubectl delete", test: (s) => /\bkubectl\s+delete\b/.test(s) },
	{ label: "aws cloudformation delete-stack", test: (s) => /\baws\s+cloudformation\s+delete-stack\b/.test(s) },
	{ label: "az group delete", test: (s) => /\baz\s+group\s+delete\b/.test(s) },
	{ label: "gcloud projects delete", test: (s) => /\bgcloud\s+projects\s+delete\b/.test(s) },
];

/** Shell commands that modify files or git state. Blocked before APPROVE PLAN. */
const MUTATING_SHELL: RegExp[] = [
	/(^|[\s\d;|&(])>{1,2}/, // output redirection (after stripping /dev/null and 2>&1)
	/\bsed\s+-i\b/,
	/\btee\b/,
	/\b(mv|cp|rm|touch|mkdir|rmdir)\b/,
	/\bgit\s+(add|commit|push|checkout|switch|stash|merge|rebase|reset|clean|restore|tag)\b/,
];

/** Returns true if any segment of the shell command is "rm" with a recursive flag. */
function isRecursiveRm(command: string): boolean {
	for (const segment of command.split(/[;&|\n]+/)) {
		const tokens = segment.trim().split(/\s+/);
		if (tokens[0] !== "rm") continue;
		const flags = tokens.filter((t) => t.startsWith("-"));
		if (flags.some((f) => f === "--recursive" || (!f.startsWith("--") && /r/i.test(f)))) {
			return true;
		}
	}
	return false;
}

function findDestructive(command: string): string | undefined {
	const rule = DESTRUCTIVE_RULES.find((r) => r.test(command));
	return rule?.label;
}

function isMutatingShell(command: string): boolean {
	const stripped = command.replace(/\d*>&\d*/g, "").replace(/\d*>>?\s*\/dev\/null/g, "");
	return MUTATING_SHELL.some((pattern) => pattern.test(stripped));
}

async function isInsideGitWorkTree(pi: ExtensionAPI, cwd: string): Promise<boolean> {
	try {
		const result = await pi.exec("git", ["rev-parse", "--is-inside-work-tree"], { cwd, timeout: 5000 });
		return result.code === 0 && result.stdout.trim() === "true";
	} catch {
		// git missing or failed to start: treat as outside a repository
		return false;
	}
}

/** Nearest existing directory for a path (the file or its parents may not exist yet). */
function nearestExistingDir(cwd: string, target: string): string {
	let current = dirname(resolve(cwd, target));
	while (!existsSync(current)) {
		const parent = dirname(current);
		if (parent === current) break;
		current = parent;
	}
	return current;
}

export default function safetyGuard(pi: ExtensionAPI): void {
	const state: GateState = { mode: "auto", approved: false, planRequired: false, smallChange: false };

	function resetState(): void {
		state.mode = "auto";
		state.approved = false;
		state.planRequired = false;
		state.smallChange = false;
	}

	function updateStatus(ctx: ExtensionContext): void {
		if (!ctx.hasUI) return;
		let label: string;
		if (state.mode === "auto") label = "auto-approve (git-only)";
		else label = state.approved ? "manual (approved)" : "manual (awaiting APPROVE PLAN)";
		const ok = state.mode === "auto" || state.approved;
		ctx.ui.setStatus("safety", ctx.ui.theme.fg(ok ? "success" : "warning", `safety: ${label}`));
	}

	pi.on("session_start", async (_event, ctx) => {
		resetState();
		updateStatus(ctx);
	});

	// Approval phrases typed by the user. Extension-injected input is ignored.
	pi.on("input", async (event, ctx) => {
		if (event.source === "extension") return { action: "continue" as const };

		const text = event.text.trim();
		if (text === "APPROVE PLAN") {
			state.approved = true;
			ctx.ui.notify("Plan approved. Writes and edits are now allowed (destructive commands still require confirmation).", "info");
			updateStatus(ctx);
		} else if (text === "PLAN REQUIRED") {
			state.mode = "manual";
			state.approved = false;
			state.planRequired = true;
			state.smallChange = false;
			ctx.ui.notify("PLAN REQUIRED set. Present a plan and wait for APPROVE PLAN for every change.", "info");
			updateStatus(ctx);
		}
		return { action: "continue" as const };
	});

	pi.on("tool_call", async (event, ctx) => {
		const input = (event.input ?? {}) as Record<string, unknown>;

		if (event.toolName === "write" || event.toolName === "edit") {
			const target = String(input.path ?? "");
			const docException = DOC_FILE.test(target) && !state.planRequired;
			const smallException = state.smallChange && !state.planRequired;

			if (state.mode === "auto") {
				const dir = nearestExistingDir(ctx.cwd, target);
				if (!(await isInsideGitWorkTree(pi, dir))) {
					return {
						block: true,
						reason: `Auto-approve mode blocks edits outside git work trees (${dir}). Use /approval manual to confirm individually.`,
					};
				}
				return undefined;
			}

			if (!state.approved && !docException && !smallException) {
				return {
					block: true,
					reason:
						"Plan not approved. Present ## Plan, ## Files Affected, ## Risks, ## Validation Steps and wait for the user to reply APPROVE PLAN.",
				};
			}

			if (!(await isInsideGitWorkTree(pi, ctx.cwd))) {
				const warning = `Not inside a git repository (${ctx.cwd}). Edits cannot be diffed or reverted with git.`;
				if (!ctx.hasUI) {
					return { block: true, reason: `${warning} Blocked: no UI to confirm.` };
				}
				const allowed = await ctx.ui.confirm("Edit outside git?", `${warning}\n\nAllow this edit to ${target}?`);
				if (!allowed) {
					return { block: true, reason: "Edit outside git was not approved." };
				}
			}
			return undefined;
		}

		if (event.toolName === "bash") {
			const command = String(input.command ?? "");

			const destructive = findDestructive(command);
			if (destructive) {
				if (!ctx.hasUI) {
					return { block: true, reason: `Destructive command blocked (no UI to confirm): ${destructive}` };
				}
				const confirmed = await ctx.ui.confirm(`Destructive command: ${destructive}`, command);
				if (!confirmed) {
					return { block: true, reason: `Destructive command not confirmed: ${destructive}` };
				}
			}

			if (state.mode === "auto") {
				if (isMutatingShell(command) && !(await isInsideGitWorkTree(pi, ctx.cwd))) {
					return {
						block: true,
						reason: `Auto-approve mode blocks mutating shell commands outside a git work tree (${ctx.cwd}). Use /approval manual to confirm individually.`,
					};
				}
				return undefined;
			}

			if (!state.approved && !state.smallChange && isMutatingShell(command)) {
				return {
					block: true,
					reason: "This shell command modifies files or git state. Wait for APPROVE PLAN first.",
				};
			}
		}

		return undefined;
	});

	pi.registerCommand("safe", {
		description: "Show safety settings. Use '/safe reset' to clear approval.",
		handler: async (args, ctx) => {
			if (args.trim() === "reset") {
				resetState();
				updateStatus(ctx);
				ctx.ui.notify("Safety state reset. Mode: auto-approve (git-only).", "info");
				return;
			}

			const inside = await isInsideGitWorkTree(pi, ctx.cwd);
			const lines = [
				"Safety settings",
				`  approval mode:    ${state.mode}`,
				`  plan approved:     ${state.approved ? "yes" : "no (send APPROVE PLAN)"}`,
				`  PLAN REQUIRED:     ${state.planRequired ? "on" : "off"}`,
				`  small-change mode: ${state.smallChange && !state.planRequired ? "on" : "off"}`,
				`  doc-file exception:${state.planRequired ? " disabled" : " enabled (.md .txt .adoc .rst)"}`,
				`  cwd in git repo:   ${inside ? "yes" : "NO (edits need confirmation)"}`,
				`  cwd:               ${ctx.cwd}`,
				"Destructive commands always require confirmation:",
				`  ${DESTRUCTIVE_RULES.map((r) => r.label).join(", ")}`,
			];
			ctx.ui.notify(lines.join("\n"), "info");
		},
	});

	pi.registerCommand("approval", {
		description: "Switch approval mode: /approval auto | manual (no argument toggles)",
		handler: async (args, ctx) => {
			const arg = args.trim().toLowerCase();
			if (arg === "auto") state.mode = "auto";
			else if (arg === "manual") state.mode = "manual";
			else if (arg === "") state.mode = state.mode === "auto" ? "manual" : "auto";
			else {
				ctx.ui.notify("Usage: /approval auto | manual", "warning");
				return;
			}
			if (state.mode === "auto") state.planRequired = false;
			updateStatus(ctx);
			ctx.ui.notify(
				state.mode === "auto"
					? "Auto-approve ON: no APPROVE PLAN needed. Edits limited to git work trees; destructive commands still confirm."
					: "Manual approval ON: APPROVE PLAN required before edits.",
				"info",
			);
		},
	});

	pi.registerCommand("small", {
		description: "Allow small non-doc changes without a plan: /small on | off",
		handler: async (args, ctx) => {
			const mode = args.trim().toLowerCase();
			if (state.planRequired) {
				ctx.ui.notify("PLAN REQUIRED is set. Clear it with '/safe reset' before enabling small-change mode.", "warning");
				return;
			}
			if (mode === "on") state.smallChange = true;
			else if (mode === "off") state.smallChange = false;
			else state.smallChange = !state.smallChange;
			ctx.ui.notify(`Small-change mode ${state.smallChange ? "ON" : "OFF"}. Destructive commands still require confirmation.`, "info");
		},
	});
}
