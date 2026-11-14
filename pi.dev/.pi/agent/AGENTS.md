# AGENTS.md: Personal Coding Standards

Applies across all working directories. Project-level `AGENTS.md` files add to these rules and do not replace them. The core safety rules are also in `APPEND_SYSTEM.md`. The `safety-guard` extension enforces the approval gate, git gate, and destructive-command confirmations.

## Profile

- Senior Java developer. Mostly Maven, Gradle, and Spring Boot.
- Occasional Terraform developer.
- Git-based workflow.
- Infrastructure changes can affect real systems.

## Workflow

Modes (slash commands):
- `/plan <task>`: analysis and plan only. No edits.
- `/review [focus]`: review without changes. Defaults to the current uncommitted changes.
- `/implement [notes]`: execute the approved plan. In manual mode, stops if `APPROVE PLAN` is missing.
- `/approval auto|manual`: switch approval mode. Default on load is `auto`: no `APPROVE PLAN` needed, but edits outside git work trees are blocked and destructive commands still need confirmation. `manual` requires `APPROVE PLAN`.
- `/safe`: show safety settings. `/safe reset` clears approval.
- `/small on|off`: allow small non-doc changes without a plan.

Approval phrases (exact text, typed by the user):
- `APPROVE PLAN`: unlocks edits for the approved plan.
- `PLAN REQUIRED`: requires a plan and approval for every change, including small ones.

Plan output format:
```
## Plan
(numbered steps in implementation order)
## Files Affected
## Risks
## Validation Steps
```

Documentation-only and small changes (comments, docs, formatting, variable renames) may run immediately unless `PLAN REQUIRED` is set. Report what changed afterward.

## Git

- Before any write, edit, or delete, run `git rev-parse --is-inside-work-tree`.
- Outside a repository: warn, explain the risk, and request approval first.
- After changes, show `git diff --stat`, then summarize files changed, lines added and removed, and risks.
- Do not commit, push, or create branches unless asked.

## Destructive operations: confirm first, every time

Require explicit confirmation before running:
- `rm -rf` (any recursive delete)
- `git reset --hard`, `git clean -fd`
- `terraform destroy`, `terraform apply`
- `kubectl delete`
- `aws cloudformation delete-stack`
- `az group delete`
- `gcloud projects delete`

Approval for one command does not carry over to others. Show the exact command before asking. Prefer `terraform plan` and dry-run flags where they exist.

## Validation: required before claiming success

| Build tool | Command |
|---|---|
| Maven | `mvn test` |
| Gradle | `./gradlew test` (use the wrapper, not a system `gradle`) |
| Terraform | `terraform fmt`, `terraform validate`; recommend `terraform plan` |

Choose the build tool from the project files (`pom.xml`, `build.gradle` or `build.gradle.kts`, `*.tf`). If a command cannot run (missing tool, no network, missing credentials), say so and say what remains unverified. Do not report success.

## Documentation sources

Trusted automatically:
- docs.oracle.com
- spring.io
- maven.apache.org
- docs.gradle.org
- learn.microsoft.com
- docs.aws.amazon.com
- registry.terraform.io
- developer.hashicorp.com
- github.com

For any other website: tell the user which site, assess its quality (official, vendor, blog, forum, AI-generated), and ask before relying on it extensively.

## Java standards

- Target the project's Java version. Prefer modern features where they improve clarity: records, sealed types, pattern matching for `instanceof` and `switch`, text blocks, `var` for obvious local types, `List.of`/`Map.of`.
- Readability over cleverness. Avoid dense streams, nested ternaries, and clever generics when a loop or named method is clearer.
- SOLID: small single-purpose classes, depend on interfaces at boundaries, constructor injection.
- No new frameworks or libraries without asking. Prefer the JDK and existing project dependencies.
- Spring Boot: constructor injection, `@ConfigurationProperties` over scattered `@Value`, explicit configuration over magic. Keep profiles and secrets out of source.
- Match the existing code style in the project. Do not reformat unrelated code.

## Terraform standards

- Prefer reusable modules with clear inputs and outputs. Keep root modules thin.
- No hardcoded values: put environment-specific values (names, regions, account IDs, sizes) in variables with descriptions and types. Use `locals` for derived values only.
- Mark sensitive variables and outputs as `sensitive = true`. Never write secrets into `.tf` files or `.tfvars` committed to git.
- Minimize destructive changes. Before proposing a change, check whether it forces replacement (`-/+` in the plan). Use `lifecycle` blocks (`prevent_destroy`, `create_before_destroy`) for stateful resources. Call out any replacement or deletion in the plan's Risks section.
- Pin provider and module versions. Run `terraform fmt` and `terraform validate` after every change.
- Do not run `terraform apply` or `terraform destroy` on your own. Recommend `terraform plan` and wait for explicit approval.

## Communication

- Be concise. Lead with the result.
- Show file paths.
- State what was verified and what was not.
