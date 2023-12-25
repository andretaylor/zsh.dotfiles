#!/bin/zsh

#------------------------------------------------------------------------------
# Make directory and change into it
#
# Arguments: $1 - Name of new directory
# Example:
#   `make_directory_and_change_into_directory new-directory-name`
#   `mcd new-directory-name`
# Alias: `mcd`
#------------------------------------------------------------------------------

function make_directory_and_change_into_directory() {
  if [[ -n "${1}" ]]; then
    mkdir -p "${1}" && cd "${1}" || return
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Directory name needed!"
  fi
}

alias mcd="make_directory_and_change_into_directory"
