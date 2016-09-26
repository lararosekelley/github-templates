#!/usr/bin/env bash

# installs github template files
# ----------

# download files

echo "downloading template files..."

url="https://raw.githubusercontent.com/tylucaskelley/github-templates/master"
files=(
    "CONTRIBUTING.md"
    "ISSUE_TEMPLATE.md"
    "PULL_REQUEST_TEMPLATE.md"
)

for file in "${files[@]}"; do
    curl -so ".github/${file}" "${url}/${file}"
done

# prompt user for name, email, and project repo

echo -n "Enter your name: "
read -r user

echo -n "Enter your email address: "
read -r email

echo -n "Enter the repository name: "
read -r repo

# read files and populate w/ command line args

files=(
    ".github/CONTRIBUTING.md"
    ".github/ISSUE_TEMPLATE.md"
    ".github/PULL_REQUEST_TEMPLATE.md"
)

echo "populating files with provided info..."

for f in "${files[@]}"; do
    if [ -f "$f" ]; then
        sed -i -e "s/{user}/${user}/g" "$f"
        sed -i -e "s/{email}/${email}/g" "$f"
        sed -i -e "s/{repo}/${repo}/g" "$f"
    fi
done

echo "done! files saved in '.github' folder."
