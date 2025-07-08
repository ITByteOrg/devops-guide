# Branch Rulesets

## Overview

Branch rulesets are in place to keep DevOps workflows consistent, reviewable, and auditable. These protections help enforce CODEOWNER reviews, prevent self-approval of pull requests, and maintain a clean history across all repositories that begin with `devops`.

This approach works well when managing workflows across separate contributor and reviewer accounts.

## Branch Ruleset Settings

On the `main` branch, these settings are enforced:

- All changes must go through a pull request  
- At least one approval is required before merging  
- CODEOWNER review is enforced when applicable  
- New commits dismiss existing approvals  
- Conversations must be resolved before merging  
- Admins follow the same rules and cannot bypass protections

Settings are defined in the [`protect-main` ruleset](https://github.com/ITByteOrg/devops-security/settings/rules/6255954) and apply to all repositories matching the `devops*` naming pattern.

## Pull Request Review Handoff

Both `itbyteenthusiast` and `ITByteLead` belong to the same maintainer. To maintain separation of duties, this workflow is followed:

- `itbyteenthusiast` opens and submits the pull request  
- `ITByteLead` reviews and approves it  

This prevents self-approval and keeps all changes compliant with CODEOWNER rules. GitHub blocks approval if the author and approver share the same role for the files involved. Admin accounts follow the same policy since bypass permissions have been removed.

## Next Step

Set up the first security tool integration.

Developer-facing tools such as Bandit will be added to `devops-world` to support pre-commit hygiene. Centralized scanners like TruffleHog, Semgrep, and SonarQube will be managed in `devops-security` to maintain separation of responsibilities and meet audit standards.
