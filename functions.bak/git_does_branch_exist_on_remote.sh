#!/bin/zsh

#------------------------------------------------------------------------------
# Check if branch exist on remote
#
# Globals:
#   None
# Arguments:
#   $1 - Branch name to check
# Example:
#   `git_does_branch_exist_on_remote branch-name-to-check`
#   `gkchk branch-name-to-check`
# Alias:
#   `gkchk`
#------------------------------------------------------------------------------

function git_does_branch_exist_on_remote() {
  if [[ -n "${1}" ]]; then
    local -r exist_on_remote=$(git ls-remote --heads origin "${1}")

    if [[ -z ${exist_on_remote} ]]; then
      echo 0
    else
      echo 1
    fi
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkchk="git_does_branch_exist_on_remote"
