#!/bin/bash
# This script sets up multiple GitHub repositories
# Create your first repo in GitHub with a LICENSE.md and README.md file
# 
# Update the following variables:
#   REPOS: List of repository names to create
#   BASE_DIR: Base directory where repositories will be created
#   START_REPO: The repository from which to copy LICENSE and README files
#   GITHUB_USER: Your GitHub username
# 
# Usage: 
# Make file executable: chmod +x setup_repos.sh
# Then in the directory where the setup_repos exists run 
# ./setup_repos.sh
# 

REPOS=("devops-security" "devops-monitoring" )
#"devops-world" "devops-infra" "devops-security" "devops-monitoring")

# Parent directory <<adjust as needed>>
BASE_DIR="C:/GitRepos"
START_REPO="devops-guide"

# Path to your existing source files
LICENSE_SOURCE="$BASE_DIR/$START_REPO/LICENSE.md"
README_SOURCE="$BASE_DIR/$START_REPO/README.md"

# GitHub username <<update this>>
GITHUB_USER="YOUR_GITHUB_USERNAME"

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

    # Copy README file to each repo
    if [[ -f "$README_SOURCE" ]]; then
        cp "$README_SOURCE" "$REPO_DIR/README.md"
        echo "Copied README.md to $REPO"
    else
        echo "WARNING: README.md not found in $START_REPO!"
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
