#!/bin/bash

is_installed() {
    local path_root=$(get_root_path_repository)
    
    if [[ -d "$path_root/.git/hooks/ht7" ]]; then
        return 0 # Installed
    else
        return 1
    fi
}
