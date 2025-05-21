#!/bin/bash

check_commands() {
    local commands=("php" "vendor/bin/phpstan" "vendor/bin/php-cs-fixer" "vendor/bin/phpunit")
    path_base=$(git rev-parse --show-toplevel) 
    
    for cmd in "${commands[@]}"; do
        [[ "$cmd" == *"/"* ]] && path_cmd="$path_base/$cmd" || path_cmd="$cmd"
        if ! command -v "$path_cmd" &> /dev/null; then
            echo "$cmd could not be found ($path_cmd). Please install it."
            # exit 1
        fi
    done 
}
