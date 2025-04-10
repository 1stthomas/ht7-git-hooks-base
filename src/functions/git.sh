#!/bin/bash

get_diff_files() {
    local diff_files
    diff_files=$(git diff --name-only HEAD)
    echo "$diff_files"
}

get_diff_untracked_files() {
    local untracked_files
    # src: https://stackoverflow.com/questions/3801321/git-list-only-untracked-files-also-custom-commands
    untracked_files=$(git ls-files --others --exclude-standard)
    echo "$untracked_files"
}
