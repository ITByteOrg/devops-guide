# Setup GitHub Repositories (Overview)

Before proceeding, ensure your **GitHub account** is set up and authenticaticated locally. This guide outlines how to structure repositories in support of a complete DevOps workflow.  

## Repository Structure
These repositories form a modular system—each serving a distinct role:  

| **REPOSITORY NAME** | **DESCRIPTION**                                                                       |
| ------------------- | ------------------------------------------------------------------------------------- |
| `devops-world`      | Python application code, CI/CD workflows, dependencies                                |
| `devops-infra`      | Infrastructure as Code (Terraform, Ansible), Kubernetes manifests, cloud provisioning |
| `devops-security`   | Configurations for SonarQube, Checkmarx, Prisma, and other security scanning tools    |
| `devops-monitoring` | Prometheus and Grafana dashboards, alerting rules                                     |
| `devops-guide`      | Centralized documentation, automation scripts, and workflow references across the stack |

## Repository Creation Options

You can set up repositories using any of the following approaches:

### 1: Manual Setup (UI-driven)

If you prefer working in GitHub’s web interface, manually creating each repository is a valid approach—especially for smaller setups or when fine-tuning repo-level settings.

> ℹ️ This guide no longer provides detailed walkthroughs of GitHub's UI. Consider starting with your main application repo and branching out from there.

### 2: BASH Automation (Recommended for Multi-repo Projects)

When splitting your application across multiple repositories, automation reduces overhead. One approach is to manually create a primary repo (like `devops-guide`) with a starter `README.md` and `LICENSE.md`, then use a Bash script to replicate structure across additional repos.

You can customize this automation to:

- Create new repos via GitHub CLI (`gh`)
- Copy in shared files like `README.md` (as a stub) and `LICENSE.md`
- Initialize consistent folder structure and commit defaults

See [`/scripts/setup_repos.sh`](../scripts/setup_repos.sh) for a starter script.

## Pick What Works For You
- Use **manual setup** when precision or UI familiarity is preferred  
- Use **automation** to replicate structure quickly across multiple repositories  
- GitHub Desktop, templates, and other tools may offer additional workflows—choose the method that best supports how your team works

## Orientation Guide ## 

You've just initialized the core scaffolding. To get oriented across roles and responsibilities, head over to [Navigation](../onboarding/navigation.md). Weekly updates have recently been added to shift toward more high-level documentation. The goal is to reduce granular detail and emphasize the reasoning behind structural decisions. Browse [updates](/updates/index.md) to follow how things evolve.

> _Other tools, such as GitHub Desktop, also provide ways to manage repositories. While not covered in this document, it may be useful depending on your workflow._

