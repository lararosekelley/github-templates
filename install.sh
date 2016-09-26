#!/usr/bin/env bash

# installs github template files
# --------

# download files

echo "downloading template files..."

url="https://raw.githubusercontent.com/tylucaskelley/github-templates/master"
files=(
    "CONTRIBUTING.md"
    "ISSUE_TEMPLATE.md"
    "PULL_REQUEST_TEMPLATE.md"
)

mkdir -p .github

for file in "${files[@]}"; do
    curl -so ".github/${file}" "${url}/${file}"
done

# prompt user for name, email, and project repo

echo -n "enter your username: " && read -r user
echo -n "enter your email address: " && read -r email
echo -n "enter the repository name: " && read -r repo

# read files and populate w/ command line args

echo "populating files with provided info..."

find .github -type f -exec sed -i '' "s/{user}/${user}/g; s/{repo}/${repo}/g; s/{email}/${email}/g" {} +

echo "done! files saved in '.github' folder."
