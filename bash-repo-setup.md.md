# Setting Up Repositories Using BASH

## Introduction

For those managing multiple repositories, automating the setup with **BASH scripting** saves time and effort. This guide explains how to use **GitHub CLI (**`gh`**)** to create repositories efficiently. Instead of manually creating each repo, this method provides a streamlined, repeatable process for repository setup.

## What You'll Learn

By following this guide, you will learn:

- [ ] How to **write a BASH script** for automated repo creation    
- [ ] How to **authenticate GitHub CLI with a Personal Access Token (PAT)**
- [ ] How to **run the script and verify repo creation**

## Why Choose This Method?

■ **Automates repetitive tasks** → Ideal for bulk repository setup 
■ **Works with GitHub CLI** → Fast and efficient repo creation 
■ **Reduces manual work** → Perfect for DevOps workflows

📌Instead of manually creating each repository, I’ve opted to **use a BASH script** for automation. This approach streamlines the setup process, making it more efficient and repeatable.  

### **Prerequisites**  
Ensure you have the following before running the script:  
- [ ] A **GitHub account** with the necessary permissions to create repositories  
- [ ]  **GitHub CLI (`gh`)** installed ([Installation Guide](https://cli.github.com/))  
- [ ]  **Personal Access Token (PAT)** for authentication ([GitHub Token Setup](https://github.com/settings/tokens))  

### **BASH Script: Automating Repository Creation**  
This script creates multiple repositories, sets visibility, and configures basic settings.  
```bash
#!/bin/bash

# GitHub username
GITHUB_USER="YourGitHubUsername"

# List of repositories to create
REPOS=("devops-world" "devops-infra" "devops-security" "devops-monitoring" "devops-ahk")

# Set visibility: "public" or "private"
VISIBILITY="private"

# Loop through repo list and create repositories
for REPO in "${REPOS[@]}"; do
    echo "Creating repository: $REPO..."
    gh repo create "$GITHUB_USER/$REPO" --"$VISIBILITY" --description "$REPO repository for DevOps setup" --confirm
    echo "$REPO created successfully!"
done

echo "All repositories created!"
```

### **Running the Script**  
1. Save the script as `setup_repos.sh`.
2. Open a terminal and navigate to the script location.  
3. Run the script:  
   ```bash
   chmod +x setup_repos.sh
   ./setup_repos.sh
   ```  
4. Verify repository creation on GitHub.  