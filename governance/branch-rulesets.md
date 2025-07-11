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

## Pull Request Review Handoff

Both `itbyteenthusiast` and `ITByteLead` belong to the same maintainer. To maintain separation of duties, this workflow is followed:

- `itbyteenthusiast` opens and submits the pull request  
- `ITByteLead` reviews and approves it  

To simulate a real-world approval process, separate contributor accounts were created. This prevents self-approval and enforces CODEOWNERS rules consistently. GitHub will block approval if the author and approver share the same role for affected files. Admins follow the same restrictions, as bypass permissions have been intentionally removed.

## Next Step

Set up the first security tool integration.

TruffleHog has been added to devops-security as the first centralized scanning tool. Additional platforms—such as Semgrep and SonarQube—will be integrated gradually to expand coverage. Developer-facing utilities like Bandit have already been introduced to devops-world for pre-commit hygiene, maintaining separation of responsibilities while aligning with audit standards.
