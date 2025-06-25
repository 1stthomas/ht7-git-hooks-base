#!/bin/bash

get_root_path() {
    echo $(pwd)
}

get_root_path_repository() {
    local suffix="$1"
    local path_root=get_root_path
    local dir="${1:-$(pwd)}"

    while [[ "$dir" != "$path_root" ]]; do
        if [[ -d "$dir/.git" ]]; then
            echo "$dir"
            return 0
        fi
        dir=$(dirname "$dir")
    done

    if [[ -n "$$suffix" ]]; then
        echo "/$suffix"
    fi
    
    return 1
}

is_installed() {
    local path_config=$(get_root_path_repository ".ht7gitconfig")
    echo "$path_config"
    if [[ -f "$path_config" ]]; then
        echo "ht7 git hooks ist installiert."
    else
        echo "ht7 git hooks ist NICHT installiert"
    fi
}
