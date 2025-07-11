# GitHub Actions Workflow-to-Job Map

This reference file lists active GitHub Actions workflows, their job IDs, and the trigger purposes behind each one. It’s designed to help readers quickly identify which workflow governs each pipeline task and where quality gates originate.

<!-- badges-start -->
| Workflow File          | Job ID         | Status Badge                                                |
|------------------------|----------------|-------------------------------------------------------------|
| branch-logic-debug.yml | branch-debug | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/branch-logic-debug.yml/badge.svg) |
| ci-dev.yml | build-test | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/ci-dev.yml/badge.svg) |
| docker-dev.yml | lint-and-build | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/docker-dev.yml/badge.svg) |
| docker-release.yml | build-and-push | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/docker-release.yml/badge.svg) |
| env-context-dump.yml | env-dump | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/env-context-dump.yml/badge.svg) |
| pr-validation.yml | lint-and-build | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/pr-validation.yml/badge.svg) |
| security_scan.yml | secret_scanning | ![status](https://github.com/ITByteOrg/devops-world/actions/workflows/security_scan.yml/badge.svg) |
<!-- badges-end -->

## Job ID to Workflow File Mapping

See [job-manifest.md](job-manifest.md) for detailed job breakdowns, including what each job does and how it validates code.

For instructions on manually triggered debugging workflows, refer to [workflow-diagnostics.md](workflow-diagnostics.md).

