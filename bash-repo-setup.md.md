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
- [ ] **GitHub CLI (`gh`)** installed ([Installation Guide](https://cli.github.com/))  
- [ ] **SSH key for authentication** ([GitHub SSH Setup Guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))  

GitHub provides a step-by-step guide for setting up SSH authentication. You can reference the official documentation on [Generating a New SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), which includes detailed setup instructions.

Alternatively, you can ask AI:  
> "How do I set up SSH authentication for GitHub?"  

### **BASH Script: Automating Repository Creation**  
This script automates the creation of multiple repositories for your DevOps journey. It sets repository visibility, initializes Git, and configures basic settings.  

💡 **Before running the script:**  
- [ ] Update any placeholders (`<<>>`) with your specific details (e.g., username, directory paths).  
- [ ] Ensure you've completed the steps in the **Prerequisites** section above.  
- [ ] The below script is saved in `\devops-guide\scripts\setup_repos.sh`

```
#!/bin/bash

# Define repo names
REPOS=("devops-world" "devops-infra" "devops-security" "devops-monitoring")

# Parent directory <<adjust as needed>>
BASE_DIR="$HOME/GitRepos"

# Path to your existing license file <<adjust as needed>>
LICENSE_SOURCE="$BASE_DIR/devops-guide/LICENSE.md"

# GitHub username <<update this>>
GITHUB_USER="ITByteEnthusiast"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Loop through repo names and create folders if necessary
for REPO in "${REPOS[@]}"; do
    REPO_DIR="$BASE_DIR/$REPO"

    if [[ -d "$REPO_DIR" ]]; then
        echo "Skipping creation: $REPO_DIR already exists"
    else
        mkdir -p "$REPO_DIR"
        echo "Created: $REPO_DIR"
    fi

    # Copy license file to each repo
    if [[ -f "$LICENSE_SOURCE" ]]; then
        cp "$LICENSE_SOURCE" "$REPO_DIR/LICENSE.md"
        echo "Copied LICENSE.md to $REPO"
    else
        echo "WARNING: License file not found in devops-guide!"
    fi

    # Initialize Git repository only if it's not already initialized
    cd "$REPO_DIR"
    if [[ ! -d ".git" ]]; then
        git init
        echo "Initialized Git repo in $REPO"
    else
        echo "Git repo already initialized in $REPO"
    fi

    # Create private GitHub repository using GitHub CLI (if not already created)
    if ! gh repo view "$GITHUB_USER/$REPO" &> /dev/null; then
        gh repo create "$GITHUB_USER/$REPO" --private --source="$REPO_DIR" --remote=origin
        echo "Created private GitHub repo: $GITHUB_USER/$REPO"
    else
        echo "GitHub repository $GITHUB_USER/$REPO already exists, skipping creation"
    fi

    # Push initial commit (only if repo is new)
    git add .
    git commit -m "Initial commit with LICENSE.md"
    git branch -M main
    git push -u origin main
    echo "Pushed initial commit to GitHub"
done

echo "All repositories have been set up as private on GitHub!"
```
### **Running the Script**  
1. Save the script as `setup_repos.sh`.
2. Open a DOS terminal and navigate to the script location.  
3. The _first time_ you run the script you will need to establish a connection to GitHub
	```
	gh auth login
	```
	Respond to the prompts and ask AI for guidance if you have questions.
	
4. Open a BASH terminal and navigate to the script location.
5. Run the script:  
   ```bash
   chmod +x setup_repos.sh
   ./setup_repos.sh
   ```  
6. Verify repository creation on GitHub.  

