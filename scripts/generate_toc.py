import os

BASE_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
OUTPUT_FILE = os.path.join(BASE_DIR, 'TOC.md')

SECTION_MAP = {
    "onboarding": "Onboarding",
    "operations": "Setup",
    "docs/ci-reference": "Repository Reference",
    "scripts": "Scripts",
    "security": "Governance & Security",
    "governance": "Governance & Security"
}

def find_markdown_files(folder):
    toc_entries = []
    for root, _, files in os.walk(os.path.join(BASE_DIR, folder)):
        for file in files:
            if file.endswith(".md"):
                full_path = os.path.join(root, file)
                rel_path = os.path.relpath(full_path, BASE_DIR).replace("\\", "/")
                title = extract_title(full_path) or file.replace(".md", "")
                toc_entries.append((title, rel_path))
    return toc_entries

def extract_title(path):
    try:
        with open(path, "r", encoding="utf-8") as f:
            for line in f:
                if line.strip().startswith("# "):
                    return line.strip().lstrip("# ").strip()
    except:
        pass
    return None

def write_toc():
    written_sections = set()
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("# DevOps Guide - Table of Contents\n\n")

        for section_name in dict.fromkeys(SECTION_MAP.values()):
            if section_name in written_sections:
                continue
            written_sections.add(section_name)

            entries = []
            for folder, mapped_name in SECTION_MAP.items():
                if mapped_name == section_name:
                    entries.extend(find_markdown_files(folder))

            if entries:
                f.write(f"## {section_name}\n")
                for title, rel_path in sorted(entries):
                    f.write(f"- [{title}]({rel_path})\n")
                f.write("\n")

        readme_path = os.path.join(BASE_DIR, "README.md")
        if os.path.exists(readme_path):
            f.write("## Other Notes\n")
            f.write("- [README](README.md)\n")

    print(f"✅ TOC generated at {OUTPUT_FILE}")

if __name__ == "__main__":
    write_toc()
