"""
generate_toc.py — Generate TOC.md for devops-guide

Description:
    This script scans the top-level folders in the devops-guide repository
    and builds a Markdown-based Table of Contents (TOC.md) listing all relevant .md files.

Usage:
    Run from the root of the devops-guide repo:

        python ./scripts/generate_toc.py

Output:
    - TOC.md written to repository root
    - Only includes folders defined in SECTIONS
    - Ignores README.md, LICENSE.md, and TOC.md itself

Notes:
    - Folder names and section headers can be customized via the SECTIONS dictionary
    - File names are formatted into readable titles for display
"""

import os

# Configuration
ROOT_DIR = "."
TOC_FILE = "TOC.md"
IGNORE = {"README.md", TOC_FILE, "LICENSE.md"}
SECTIONS = {
    "setup": "Setup",
    "policies": "Workflow Policies",
    "security": "Security",
    "weekly-updates": "Weekly Updates",
    "blog": "Blog",
    "architecture": "Architecture",
    "onboarding": "Onboarding",
}

def format_link(folder, file):
    label = file.replace(".md", "").replace("-", " ").title()
    path = os.path.join(folder, file).replace("\\", "/")
    return f"- [{label}]({path})"

toc_lines = ["# Table of Contents\n"]

for folder, header in SECTIONS.items():
    folder_path = os.path.join(ROOT_DIR, folder)
    if not os.path.isdir(folder_path):
        continue
    toc_lines.append(f"## {header}\n")
    for file in sorted(os.listdir(folder_path)):
        if file.endswith(".md") and file not in IGNORE:
            toc_lines.append(format_link(folder, file))
    toc_lines.append("")

with open(TOC_FILE, "w") as toc_out:
    toc_out.write("\n".join(toc_lines))

print(f"TOC.md updated successfully")
