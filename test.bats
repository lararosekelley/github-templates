#!/usr/bin/env bats

# lint markdown files
# --------

if ! markdownlint --help &> /dev/null; then
    echo "Error: markdownlint-cli not installed. Run npm install -g markdownlint-cli and try again."
    exit 1
fi

if ! shellcheck --version &> /dev/null; then
    echo "Error: shellcheck not installed. View installation instructions here:"
    echo "https://github.com/koalaman/shellcheck#installing"
    exit 1
fi

@test "markdown files conform to rules defined in .markdownlintrc" {
    run markdownlint *.md .github

    [ "$status" -eq 0 ]
}

@test "install.sh passes shellcheck" {
    run shellcheck install.sh

    [ "$status" -eq 0 ]
}
