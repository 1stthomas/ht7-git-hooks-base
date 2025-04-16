#!/bin/bash

get_diff_files() {
    local diff_files
    diff_files=$(git diff --name-only HEAD)
    echo "$diff_files"
}

get_diff_files_all() {
    local files_tracked
    files_tracked=$(get_diff_files)
    local files_untracked
    files_untracked=$(get_diff_files_untracked)
    local separator
    [ -n "$files_tracked" ] && [ -n "$files_untracked" ] && separator="\n" || separator=""
    local files_all
    files_all=$(printf "%s%s%s" $files_tracked $separator $files_untracked)

    echo "$files_all"
}

get_diff_files_untracked() {
    local untracked_files
    # src: https://stackoverflow.com/questions/3801321/git-list-only-untracked-files-also-custom-commands
    untracked_files=$(git ls-files --others --exclude-standard)
    echo "$untracked_files"
}
