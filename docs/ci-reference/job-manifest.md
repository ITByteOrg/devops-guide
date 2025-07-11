# GitHub Actions Job Manifest

This document catalogs all jobs used in GitHub Actions workflows within `ITByteOrg/devops-world`. It maps each job ID to its corresponding workflow file and outlines the intent behind its execution.

<!-- badges-start -->
| Job ID         | Workflow File          | Purpose |
|----------------|------------------------|---------|
| branch-debug | branch-logic-debug.yml | Diagnostic tool: test branch names - manually triggered |
| build-test | ci-dev.yml | Lint and test Python code on dev branches and PRs |
| lint-and-build | docker-dev.yml | Lint and build Docker image on dev branches |
| build-and-push | docker-release.yml | Build and push Docker image on main and release branches |
| env-dump | env-context-dump.yml | Diagnostic Tool: Dump GitHub Actions context and environment variables |
| lint-and-build | pr-validation.yml | Lint and build Dockerfile in pull requests |
| secret-scanning | security-scan.yml | Run security scans on the codebase |
<!-- badges-end -->

## Workflow Diagnostics

Jobs marked as diagnostic tools—such as `branch-debug` or `env-dump`—are manually triggered and used for inspection and troubleshooting. Usage instructions are available in [workflow-diagnostics.md](workflow-diagnostics.md).

