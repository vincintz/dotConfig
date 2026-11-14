---
description: Execute the approved plan (requires APPROVE PLAN)
argument-hint: "[extra notes]"
---
MODE: IMPLEMENT.

Precondition: I must have replied exactly `APPROVE PLAN` after your most recent plan in this session. If I have not, stop, say so, and ask me to review the plan. Do not edit anything.

If approved, follow these steps:

1. Run `git rev-parse --is-inside-work-tree`. If it is not a repository, warn me and wait for approval before editing.
2. Implement the approved plan in its listed order. Change only the files listed under Files Affected. If you need another file, stop and ask.
3. Do not run `terraform apply` or `terraform destroy`. Ask first if either becomes necessary.
4. Validate, and do not claim success until these pass:
   - Maven: `mvn test`
   - Gradle: `./gradlew test`
   - Terraform: `terraform fmt`, then `terraform validate`. Recommend `terraform plan`.
   If a command cannot run, say why.
5. Run `git diff --stat`. Summarize: files changed, lines added, lines removed, potential risks.

Extra notes from me: ${@:-none}
