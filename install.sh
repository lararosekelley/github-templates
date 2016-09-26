#!/usr/bin/env bash

# installs github template files
# ----------

# usage prompt

read -r -d '' usage << EOF
usage: bash install.sh [-h] -u username -e email -r repository

installs github template files and substitutes placeholder text for
actual user info

required arguments:
    -u username (github username)
    -e email (email address)
    -r repository name (github repository name)

optional arguments
    -h (displays this message)
EOF

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

user=""
email=""
repo=""

OPTIND=1 # reset getopts in case it was used before

while getopts ":u:e:r:h?" opt; do
    case "$opt" in
        u) user=$OPTARG
            ;;
        e) email=$OPTARG
            ;;
        r) repo=$OPTARG
            ;;

        # error handling and help

        h|\?) echo "$usage" && exit 0
            ;;

        :) echo "fatal: option -$OPTARG requires an argument" && exit 1
            ;;
    esac
done

shift "$((OPTIND-1))" && [ "$1" = "--" ] && shift # shift off options

# exit if missing args

if [[ -z $user || -z $email || -z $repo ]]; then
    echo "$usage" && exit 1
fi

# read files and populate w/ command line args

files=(
    ".github/CONTRIBUTING.md"
    ".github/ISSUE_TEMPLATE.md"
    ".github/PULL_REQUEST_TEMPLATE.md"
)

for f in "${files[@]}"; do
    if [ -f "$f" ]; then
        sed -i -e "s/{user}/${user}/g" "$f"
        sed -i -e "s/{email}/${email}/g" "$f"
        sed -i -e "s/{repo}/${repo}/g" "$f"
    fi
done

echo "done! files saved in '.github' folder."
