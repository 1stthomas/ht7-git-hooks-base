#!/bin/bash

get_diff_files() {
    echo $(git diff --name-only HEAD)
}

get_diff_files_all() {
    local files_tracked
    files_tracked=$(get_diff_files)
    local files_untracked
    files_untracked=$(get_diff_files_untracked)
    local separator
    [ -n "$files_tracked" ] && [ -n "$files_untracked" ] && separator=" " || separator=""
    
    printf "%s%s%s" "$files_tracked" "$separator" "$files_untracked"
}

get_diff_files_untracked() {
    # src: https://stackoverflow.com/questions/3801321/git-list-only-untracked-files-also-custom-commands
    echo $(git ls-files --others --exclude-standard)
}
