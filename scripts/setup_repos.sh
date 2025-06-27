#!/bin/bash

# Define repo names
REPOS=("devops-security" "devops-monitoring" )
#"devops-world" "devops-infra" "devops-security" "devops-monitoring")

# Parent directory <<adjust as needed>>
BASE_DIR="C:/GitRepos"

# Path to your existing license file
LICENSE_SOURCE="$BASE_DIR/devops-guide/LICENSE.md"

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
