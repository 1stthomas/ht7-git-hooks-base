#!/bin/bash

check_commands() {
    local commands=("php" "phpstan" "php-cs-fixer" "phpunit")
    for cmd in "${commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            echo "$cmd could not be found. Please install it."
            # exit 1
        fi
    done
}
