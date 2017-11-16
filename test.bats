#!/usr/bin/env bats

# lint markdown files
# --------

if ! mdl --help &> /dev/null; then
    echo "fatal: markdownlint not installed. run 'gem install mdl' to download it"
    exit 1
fi

@test "markdown files conform to rules defined in mdl.style.rb" {
    run mdl -c .mdlrc .

    [ "$status" -eq 0 ]
}
