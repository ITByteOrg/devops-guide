# Manual Setup in GitHub

## Introduction

This guide provides the steps to walk you through the **manual process** of creating GitHub repositories using the web interface. If you’re new to GitHub or prefer a **hands-on approach**, this method ensures full control over repo settings without needing command-line tools or automation scripts.

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
   - Click **New** button
   - Name the repository (e.g., `devops-world`)  
   - Choose **public** or **private**  
   - Choose **License** (or leave it blank)
   - Click **Create Repository**  

2️. **Clone Repository Locally**  
   ```bash
   git clone https://github.com/YourUsername/devops-world.git
   cd devops-world
   ```  

3️. **Initialize Git & Push Changes**  
   ```bash
   git init
   touch README.md
   touch .gitignore
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git push -u origin main
   ```
   _The_ `touch README.md` _command creates an empty README file. This is necessary because pushing an empty branch will result in an error. Additionally, creating a_ `.gitignore` _file early helps prevent unnecessary files from being committed later. After using your software tools, update_ `.gitignore` _to exclude generated folders like_ `.obsidian/`_,_ `.vs/`_, or_ `node_modules/`_.  If you're unsure what to include, you can ask AI for `.gitignore` recommendations based on the generated folders in your branch._  

5️. Set Up GitHub Actions (For CI/CD)  
   - Navigate to the **Actions** tab in GitHub  
   - Click **New Workflow**  
   - Use the appropriate YAML configuration for automation  
   - Commit and push the workflow file to trigger automation  

6️. Configure Repository Settings  
   - Set up **branch protection rules** to manage merge permissions  
   - Enable **security scanning tools** for vulnerability detection  
   - Define **access controls** for collaborators and teams  

### Skipping the Last Two Steps
For now, I’ve chosen **not to configure GitHub Actions or branch protection rules** yet. These steps will be addressed later **once the workflow is finalized**.  

📌 If you prefer to set them up now, refer to GitHub’s official documentation:  
- [GitHub Actions Setup](https://docs.github.com/actions)  
- [Branch Protection rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule) 

## Next Step

Now that your repository setup is complete, it's time to load your application! Head over to the [README](https://github.com/ITByteEnthusiast/devops-world/blob/main/README.md) in devops-world for the next steps.

