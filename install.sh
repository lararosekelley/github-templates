#!/usr/bin/env bash
# installs github template files
# ----------

# start

echo "installing tylucaskelley/github-templates..."
mkdir -p .github

# download files

url="https://raw.githubusercontent.com/tylucaskelley/github-templates/master"
files=(
    "CONTRIBUTING.md"
    "ISSUE_TEMPLATE.md"
    "PULL_REQUEST_TEMPLATE.md"
    "generate.sh"
)

for file in "${files[@]}"; do
    curl -sO "${url}/${file}" -o ".github/${file}"
done

echo "done! files saved in '.github' folder."
