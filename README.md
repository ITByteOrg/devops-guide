### Documentation Notice
This repository is actively evolving. Some documentation is incomplete, and certain links or references may be out of date while improvements are in progress. The structure, content, and tooling may change frequently as this guide matures. Contributions are currently closed while refinement is underway.

# DevOps Guide
_A hands-on journey in building a complete DevOps stack from the ground up, exploring real-world challenges, trade-offs, and practical solutions._

---
## Overview
This repository documents my process of building a **DevOps workflow** from scratch, focusing on automation, infrastructure, security, and observability. The challenge is to set it up using free tools, showing how DevOps principles can be implemented without costly investments.

While free tools are not suitable for high-demand production environments, this experiment provides a foundation for learning. The goal is to create a working framework that I can use to swap out tools that better handle production-scale workloads.

---
## DevOps Stack
### Core Components
- **Documentation**: Visual Studio Code, Obsidian [^1]
- **Application**: A simple Python app showing ISS information
- **IDE**: Visual Studio Code 
- **Programming Language**: Python
- **Version Control**: Git  
- **Framework:** Flask (Python based framework for dynamic content) 

### CI/CD & Security
- **Continuous Integration & Delivery**: GitHub Actions (YAML workflows & automation)  
- **Security Scanning**: For details on how security is set up, see the [Security Tools](security/security-tools.md)

### Infrastructure & Cloud
- **Cloud Provider**: Google Cloud Platform (dev-instance, UAT-instance, prod-instance)  
- **Domain Management**: iFreeDomain (custom domain for public access)
- **Containerization**: Docker (for local testing)  
- **Orchestration**: Kubernetes (pod management & networking)  
- **Image Management**: JFrog Artifactory (Docker and binaries)  
- **Package Management**: Nexus (Python dependencies)  
- **Static Content:** Nginx (Reverse proxy, static content, fallback)

### Automation & Monitoring
- **Configuration Management**: Ansible (automates infrastructure setup)  
- **Infrastructure as Code (IaC)**: Terraform (provisions cloud resources)  
- **Monitoring**: Prometheus  
- **Observability & Dashboards**: Grafana  

[^1]: I started using Obsidian for its bidirectional linking and graph view features, but switched to VS Code for day to day documentation. Obsidian is still used for graph view. 

---

## Orientation Guide ## 

For those that are ready to explore and get oriented across roles and responsibilities, head over to [Navigation](/onboarding/navigation.md). Weekly updates have recently been added to shift toward more high-level documentation. The goal is to reduce granular detail and emphasize the reasoning behind structural decisions. Browse [updates](/updates/index.md) to follow how things evolve.


---
## Repositories & Organization
This repository is part of a broader DevOps stack, broken into specialized repositories:

| **Repo Name**       | **Purpose**                                                    |
| ------------------- | -------------------------------------------------------------- |
| `devops-guide`      | Documentation & project workflow                               |
| `devops-world`      | Python app code, CI/CD workflows, dependencies                 |
| `devops-infra`      | Terraform, Ansible, K8s manifests, cloud provisioning          |
| `devops-security`   | Security scanning configs (SonarQube, Checkmarx, Prisma, etc.) |
| `devops-monitoring` | to be created: Prometheus, Grafana dashboards, alerting rules  |


---
## Next Step

Ready for a journey? [Start Here](onboarding/start-here.md)

---
## Contributing

This project is shared under the **CC-BY-4.0** license and may be used or adapted freely.

While formal contributions (e.g. pull requests) aren't currently accepted, feedback or ideas are always welcome via issues or mentions.

If the tools prove useful, feel free to star or fork for your own use.

## Maintainer
Developed and maintained by ITByteEnthusiast.

---
## License
This project is licensed under **Creative Commons Attribution 4.0 International License (CC-BY-4.0).  
🔗 **Full license details:** [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)
