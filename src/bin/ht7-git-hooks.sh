#!/bin/bash

if [[ -z "$COMPOSER_RUNTIME_BIN_DIR" ]]; then
  BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
  BIN_DIR="$COMPOSER_RUNTIME_BIN_DIR"
fi

# echo "$(dirname "$0")/initialization.sh"
source functions/environment.sh
source functions/initialization.sh

pwd

echo $(get_root_path_repository)

# source ./functions/initialization.sh


# source "$(dirname "$0")/initialization.sh"

echo "after source"
