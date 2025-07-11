# GitHub Workflow Diagnostics Guide

This guide documents manually triggered workflows designed to inspect GitHub Actions behavior, debug branch filters, and expose environment context for analysis.

| Job ID Name | Workflow File | Purpose |
|-------------|---------------|---------|
| branch-debug | branch-logic-debug.yml | Diagnostic tool: test branch names - manually triggered |
| env-dump | env-context-dump.yml | Diagnostic Tool: Dump GitHub Actions context and environment variables |

These workflows use the `workflow_dispatch` trigger and must be started manually from the GitHub Actions tab.

The jobs listed here are also referenced in:
- [workflow-routes.md](workflow-routes.md) for their routing summary
- [job-manifest.md](job-manifest.md) for their job ID mapping

## How to Trigger a Diagnostic Workflow

1. Navigate to your repository on GitHub (`ITByteOrg/devops-world`)
2. Click the **Actions** tab
3. Select the workflow you want to run
4. Use the **"Run workflow"** button and choose any optional parameters
5. Review results via:
   - Console logs
   - Uploaded artifacts (if applicable)

## Use Cases

- Troubleshooting why an event trigger isn’t firing
- Validating branch filters or naming logic
- Inspecting environment variables, secrets access, or payload shape

## Notes

- These workflows are manually triggered (`workflow_dispatch`) and won’t run automatically during typical CI events
- They’re ideal for auditing context issues across forks, feature branches, or external contributions





