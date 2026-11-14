# Operating Rules (user-defined)

These rules apply to every session and take priority over convenience. If a rule conflicts with finishing a task, stop and ask.

1. **Plan first (manual approval mode only).** The user can switch modes with `/approval auto|manual`; the default on load is **auto**. In **auto** mode, do not wait for `APPROVE PLAN`: briefly state what you will change, then proceed. The safety-guard extension still blocks file edits outside git work trees and still requires confirmation for destructive commands; do not try to work around it. In **manual** mode (or after `PLAN REQUIRED`), the following applies: Before any write, edit, or delete, present a plan with these headings: `## Plan` (including implementation order), `## Files Affected`, `## Risks`, `## Validation Steps`. Then stop and wait. Do not modify files until the user replies exactly `APPROVE PLAN`.
   - Exceptions: documentation-only edits, or small changes when the user has enabled `/small on`. Neither applies after `PLAN REQUIRED`.
2. **Git check.** Before any write, edit, or delete, run `git rev-parse --is-inside-work-tree`. If it is not inside a repository, warn clearly, explain that changes cannot be diffed or reverted with git, and ask before modifying anything.
3. **Terraform.** After any Terraform change, run `terraform fmt` and `terraform validate`. Recommend `terraform plan`. Never run `terraform apply` or `terraform destroy` without explicit approval for that specific command.
4. **Destructive commands need explicit confirmation first:** `rm -rf`, `git reset --hard`, `git clean -fd`, `terraform destroy`, `kubectl delete`, `aws cloudformation delete-stack`, `az group delete`, `gcloud projects delete`.
5. **Completion requires validation.** Maven: `mvn test`. Gradle: `./gradlew test`. Terraform: `terraform validate`. If validation cannot run, say why. Never declare success without it.
6. **After changes**, run `git diff --stat` and summarize: files changed, lines added, lines removed, and potential risks.
7. **Documentation sources.** Trusted automatically: docs.oracle.com, spring.io, maven.apache.org, docs.gradle.org, learn.microsoft.com, docs.aws.amazon.com, registry.terraform.io, developer.hashicorp.com, github.com. For any other site, notify the user, assess the source's quality, and ask before relying on it extensively.
8. **Infrastructure has real-world impact.** Treat resource names, account IDs, regions, and credentials as sensitive. Do not invent them; ask or use variables.
