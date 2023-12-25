#!/bin/zsh

#------------------------------------------------------------------------------
# Remove remote branch
#
# Globals:
#   None
# Arguments:
#   $1 - Local branch name to delete
# Example:
#   `git_remove_remote_branch branch-to-delete`
#   `gkremover branch-to-delete`
# Alias:
#   `gkremover`
#------------------------------------------------------------------------------

function git_remove_remote_branch() {
  if [[ -n "${1}" ]]; then
    git push origin --delete "${1}"
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkremover="git_remove_remote_branch"
