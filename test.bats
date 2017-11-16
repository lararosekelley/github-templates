#!/usr/bin/env bats

# lint markdown files
# --------

if ! mdl --help &> /dev/null; then
    echo "fatal: markdownlint not installed."
    exit 1
fi

if ! shellcheck --version &> /dev/null; then
    echo "fatal: shellcheck not installed."
    exit 1
fi

@test "markdown files conform to rules defined in mdl.style.rb" {
    run mdl -c .mdlrc .

    [ "$status" -eq 0 ]
}

@test "install.sh passes shellcheck" {
    run shellcheck install.sh

    [ "$status" -eq 0 ]
}
