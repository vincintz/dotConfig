---
description: Review code without modifying anything
argument-hint: "[focus or path]"
---
MODE: REVIEW ONLY. Do not create, modify, or delete files. Do not run commands that change state.

Scope: ${@:-the current uncommitted changes (git status and git diff)}

Review for correctness, security, error handling, concurrency, and test coverage. For infrastructure (Terraform), also review destructive or replacement changes, hardcoded values, and sensitive data handling.

Report findings grouped by severity:
- **Blocker**: must fix before merge
- **Major**: should fix
- **Minor**: style or nits

Each finding needs a file path and line reference, and a one-line suggested fix. Do not write the fix.

Finish with:
- `git diff --stat` output, if the scope includes uncommitted changes
- Overall risk summary
- Which validation commands I should run (`mvn test` or `./gradlew test`, `terraform validate`)
