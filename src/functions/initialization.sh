#!/bin/bash

get_root_path_repository() {
    local path_root=get_root_path
    local dir="${1:-$(pwd)}"

    while [[ "$dir" != "$path_root" ]]; do
        if [[ -d "$dir/.git" ]]; then
            echo "$dir"
            return 0
        fi
        dir=$(dirname "$dir")
    done
    
    return 1
}

is_installed() {
    local path_root=$(get_root_path_repository)
    
    if [[ -d "$path_root/.git/hooks/ht7" ]]; then
        return 0
    else
        return 1
    fi
}
