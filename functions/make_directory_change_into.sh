#!/bin/zsh

#-------------------------------------------------------------
# Make directory and change into it
#
# Globals:
#   None
# Arguments:
#   $1 - Name of new directory
# Alias:
#   `mcd`
# Example:
#   `make_directory_and_change_into_directory new-directory-name`
#   `mcd new-directory-name`
#-------------------------------------------------------------

function make_directory_and_change_into_directory() {
  if [[ -n "${1}" ]]; then
    mkdir -p "${1}" && cd "${1}";
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Directory name needed!"
  fi
}

alias mcd="make_directory_and_change_into_directory"