#!/usr/bin/env bash

# installs github template files
# --------

# variables

red="\e[0;31m"
green="\e[0;32m"
reset="\e[0m"
check="\xE2\x9C\x94"
url="https://raw.githubusercontent.com/tylucaskelley/github-templates/master"
files=(
    "CONTRIBUTING.md"
    "ISSUE_TEMPLATE.md"
    "PULL_REQUEST_TEMPLATE.md"
)

# create .github folder

mkdir -p .github

echo -e "Creating .github folder... ${green}done ${check}${reset}"

# download template files

for file in "${files[@]}"; do
    curl -so ".github/${file}" "${url}/${file}"
done

echo -e "Downloading template files... ${green}done ${check}${reset}\n"

# prompt user for name, email, and project repo

echo -ne "Repository name: " && read -r repo
echo -ne "Repository owner's username: " && read -r owner
echo -ne "Primary contact's username: " && read -r user
echo -ne "Primary contact's email address: " && read -r email

# read files and populate w/ command line args

find .github -type f -exec sed -i '' "s/{owner}/${owner}/g; s/{user}/${user}/g; s/{repo}/${repo}/g; s/{email}/${email}/g" {} +

echo -e "\nAdding provided information to template files... ${green}done ${check}${reset}\n"

# all done

echo "Template files downloaded and populated with provided information!"
echo -e "Don't forget to add your code style guidelines to ${red}CONTRIBUTING.md${reset}"
