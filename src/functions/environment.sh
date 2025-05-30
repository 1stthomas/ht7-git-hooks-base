#!/bin/bash

get_root_path() {
    echo $(pwd)
}

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
