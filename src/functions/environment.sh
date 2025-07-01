#!/bin/bash

get_root_path() {
    echo $(pwd)
}

get_root_path_repository() {
    local suffix="$1"
    local path_root=get_root_path
    local dir="${2:-$(pwd)}"
    local found=1

    while [[ "$dir" != "$path_root" ]]; do
        if [[ -d "$dir/.git" ]]; then
            echo "$dir"
            found=0
            break
        fi
        dir=$(dirname "$dir")
    done

    if [[ "$found" -eq 0 ]]; then
      if [[ -n "$suffix" ]]; then
        echo "$dir/$suffix"
      else
        echo "$dir"
      fi
    fi
    
    return "$found"
}

is_installed() {
    local path_config=$(get_root_path_repository ".ht7gitconfig")
    echo "config path: "
    echo "$path_config"
    if [[ -f "$path_config" ]]; then
        echo "ht7 git hooks ist installiert."
        return 0
    else
        echo "ht7 git hooks ist NICHT installiert"
        return 1
    fi
}
