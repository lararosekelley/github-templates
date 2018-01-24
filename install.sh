#!/usr/bin/env bash
# shellcheck disable=SC1117

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

# defaults from current directory and git config

repo_default="$(basename "$(git rev-parse --show-toplevel)")"
owner_contact_default="$(git config user.email | cut -d '@' -f 1)"
email_default="$(git config user.email)"

# prompt user for name, email, and project repo

echo -e "Enter information (leave blank for defaults):\n"

echo -ne "Repository name (${repo_default}): " && read -r repo_input
echo -ne "Repository owner's username (${owner_contact_default}): " && read -r owner_input
echo -ne "Primary contact's username (${owner_contact_default}): " && read -r user_input
echo -ne "Primary contact's email address (${email_default}): " && read -r email_input

# set to input or default values

repo=${repo_input:-$repo_default}
owner=${owner_input:-$owner_contact_default}
user=${user_input:-$owner_contact_default}
email=${email_input:-$email_default}

# read files and populate w/ command line args

find .github -type f -exec sed -i '' "s/{owner}/${owner}/g; s/{user}/${user}/g; s/{repo}/${repo}/g; s/{email}/${email}/g" {} +

echo -e "\nAdding provided information to template files... ${green}done ${check}${reset}\n"

# all done

echo "Template files downloaded and populated with provided information."
echo -e "Don't forget to add your code style guidelines to ${red}CONTRIBUTING.md${reset}"
