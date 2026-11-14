---
description: Analyze a task and produce a plan only (no edits)
argument-hint: "<task description>"
---
MODE: PLAN ONLY. Do not create, modify, or delete any file. Do not run state-changing commands (no git add/commit/reset, no terraform apply/destroy, no deploys). You may read files and run read-only commands.

Task: ${@:-(no task given; ask me what to plan)}

Analyze the task and reply with exactly these sections:

## Plan
Numbered steps in implementation order, with a rough effort estimate for each.

## Files Affected
Each file path, and whether it is created, modified, or deleted.

## Risks
Include destructive or replacement changes, data or infrastructure impact, and anything you could not verify.

## Validation Steps
The commands to run: `mvn test` or `./gradlew test` for Java, and `terraform fmt`, `terraform validate`, and `terraform plan` for Terraform.

End by asking me to reply `APPROVE PLAN` to proceed. Do not start implementation.
