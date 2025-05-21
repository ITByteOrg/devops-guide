# **Setup GitHub Repositories (Overview)

Before proceeding, ensure that you have successfully created your **GitHub account**. If you haven’t, refer to the **previous section** before continuing.  

## **Repository Structure**  
This guide outlines how to set up repositories for a **complete DevOps workflow**, ensuring proper organization and version control.  

### **Repos to Create**  
Below are the repositories that will be created, each serving a distinct purpose within the DevOps framework:  

| **REPOSITORY NAME** | **DESCRIPTION**                                                                       |
| ------------------- | ------------------------------------------------------------------------------------- |
| `devops-world`      | Python application code, CI/CD workflows, dependencies                                |
| `devops-infra`      | Infrastructure as Code (Terraform, Ansible), Kubernetes manifests, cloud provisioning |
| `devops-security`   | Configurations for SonarQube, Checkmarx, Prisma, and other security scanning tools    |
| `devops-monitoring` | Prometheus and Grafana dashboards, alerting rules                                     |
| `devops-ahk`        | Automation scripts for efficiency                                                     |
## **Choose Your Approach**

There are **three ways** to set up repositories for your DevOps workflow. Select the method that best suits your needs:
### **Option 1: BASH Automation (Recommended for Efficiency)**

■ Best for **bulk repo creation** with minimal manual work 
■ Uses **GitHub CLI (**`gh`**)** for automation 
■ Requires a **Personal Access Token (PAT) for authentication**

⚡ **Want a faster way to create repositories?** Instead of manually creating each repo, this method **automates the process with a BASH script**. It streamlines repository creation, ensuring consistency and repeatability in DevOps workflows.

📌 _See the_ [Setting Up Repositories Using BASH](bash-repo-setup.md) _guide for details._

### **Option 2: Git Commands for Manual Duplication**

■ Best for **preserving repository history** when duplicating existing repos 
■ Does **not** require scripting, but involves **manual Git commands** 
■ Can be done with **HTTPS or SSH authentication**

📌 _See the_ [Duplicating Repositories with Git Commands](git-manual-duplication.md) _section for details._

### **Option 3: Manually Setting Up Repositories in GitHub**

■ Best for **those who prefer using the GitHub web interface** 
■ Requires **manual repo creation and configuration** 
■ No CLI tools needed—everything is done via GitHub UI

📌 _See the_ [Manual Setup in GitHub](manual-github-setup.md) _section for details._

## **Which One Should You Use?**

- **Use BASH automation** for **efficiency and bulk repo creation**    
- **Use Git commands** when **duplicating existing repositories**    
- **Use GitHub’s web interface** if you **prefer a hands-on, manual setup**
