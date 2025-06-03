# **DevOps Guide**  
_A hands-on journey in building a complete DevOps stack from the ground up, exploring real-world challenges, trade-offs, and practical solutions._

## **Overview**
This repository documents my process of building a **DevOps workflow** from scratch, focusing on automation, infrastructure, security, and observability.

## **DevOps Stack**
### **Core Components**
- **Documentation**: Visual Studio Code, Obsidian [^1]
- **Application**: A simple Python app showing ISS information
- **IDE**: Visual Studio Code 
- **Programming Language**: Python
- **Version Control**: Git  
- **Framework:** Flask (Python based framework for dynamic content) 

### **CI/CD & Security**
- **Continuous Integration & Delivery**: GitHub Actions (YAML workflows & automation)  
- **Security Scanning**: SonarQube, Checkmarx, BlackDuck, TruffleHog, Prisma Cloud  

### **Infrastructure & Cloud**
- **Cloud Provider**: Google Cloud Platform (dev-instance, UAT-instance, prod-instance)  
- **Containerization**: Docker (for local testing)  
- **Orchestration**: Kubernetes (pod management & networking)  
- **Image Management**: JFrog Artifactory (Docker and binaries)  
- **Package Management**: Nexus (Python dependencies)  
- **Static Content:** Nginx (Reverse proxy, static content, fallback)

### **Automation & Monitoring**
- **Configuration Management**: Ansible (automates infrastructure setup)  
- **Infrastructure as Code (IaC)**: Terraform (provisions cloud resources)  
- **Monitoring**: Prometheus  
- **Observability & Dashboards**: Grafana  

[^1]: I started using Obsidian for its bidirectional linking and graph view features, but switched to VS Code as those advanced features were not essential for my workflow.

---
## **Repositories & Organization**
This repository is part of a broader DevOps stack, broken into specialized repositories:

| **Repo Name**       | **Purpose**                                                    |
| ------------------- | -------------------------------------------------------------- |
| `devops-guide`      | Documentation & project workflow                               |
| `devops-world`      | Python app code, CI/CD workflows, dependencies                 |
| `devops-infra`      | Terraform, Ansible, K8s manifests, cloud provisioning          |
| `devops-security`   | Security scanning configs (SonarQube, Checkmarx, Prisma, etc.) |
| `devops-monitoring` | Prometheus, Grafana dashboards, alerting rules                 |
| `devops-ahk`        | AHK automation scripts (for efficiency)                        |

---
## **License**
This project is licensed under **Creative Commons Attribution 4.0 International License (CC-BY-4.0).  
🔗 **Full license details:** [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/)

## **Contributions**
At this time, this repository is not open for external contributions. However, you are welcome to explore the content, learn from it, and use it within the terms of the **CC-BY-4.0** license. Thank you for your interest!

## **Contact**
For questions or suggestions, reach out via [GitHub Issues](https://github.com/ITByteEnthusiast/devops-guide/issues).