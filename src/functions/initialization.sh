#!/bin/bash

is_installed_old() {
  local path_root=$(get_root_path_repository)
  
  if [[ -d "$path_root/.git/hooks/ht7" ]]; then
    if [[ -f "$repo_root/somef.ht7git" ]]; then
      return 0 # Installed
    else
      return 1
    fi
  else
    return 1
  fi
}
