# Manual Setup in GitHub

## Introduction

This guide walks through the **manual process** of creating GitHub repositories using the web interface. If you’re new to GitHub or prefer a **hands-on approach**, this method ensures full control over repo settings without needing command-line tools or automation scripts.

## What You’ll Learn

- [ ] How to **create a new repository** from GitHub’s web UI 
- [ ] How to **configure repository settings** (private/public, branch rules) 
- [ ] How to **initialize a repository and push code** manually

## Why Choose This Method?

■ **Simple & UI-friendly** → No CLI tools required 
■ **Step-by-step setup** → Ideal for beginners or detailed customization 
■ **Full control** over repository settings

## Manual Setup Steps
Below are the general steps to set up the repositories manually. **Steps 4 & 5 are optional at this stage and will be configured later.**  

For each repo, follow these steps:  

1️. **Create Repository on GitHub**  
   - Navigate to [GitHub](https://github.com/)  
   - Click **New Repository**  
   - Name the repository (e.g., `devops-world`)  
   - Choose **public** or **private**  
   - Click **Create Repository**  

2️. **Clone Repository Locally**  
   ```bash
   git clone https://github.com/YourUsername/devops-world.git
   cd devops-world
   ```  

3️. **Initialize Git & Push Changes**  
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git push -u origin main
   ```

4️. **Setup GitHub Actions (For CI/CD)**  
   - Navigate to **Actions** tab in GitHub  
   - Click **New Workflow**  
   - Use the appropriate YAML configuration for automation  

5️. **Configure Repo Settings**  
   - Set up branch protection rules  
   - Enable security scanning tools  
   - Define access controls  

### **Skipping the Last Two Steps**  
For now, I’ve chosen **not to configure GitHub Actions or branch protection rules** yet. These steps will be addressed later **once the workflow is finalized**.  

📌 If you prefer to set them up now, refer to GitHub’s official documentation:  
- [GitHub Actions Setup](https://docs.github.com/actions)  
- [Branch Protection Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-branches-and-merges-in-your-repository/about-branch-protection-rules)  

