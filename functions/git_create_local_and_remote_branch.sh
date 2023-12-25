#!/bin/zsh

#------------------------------------------------------------------------------
# Create local and remote branch
#
# Globals:
#   None
# Arguments:
#   $1 - branch name to create
# Example:
#   `git_create_local_and_remote_branch branch-name-to-create`
#   `gbn branch-name-to-create`
# Alias:
#   `gbn`
#------------------------------------------------------------------------------

function git_create_local_and_remote_branch() {
  if [[ -n "${1}" ]]; then
    git checkout -b "${1}" &&
      git push origin "${1}" &&
      git push --set-upstream origin "${1}"
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gbn="git_create_local_and_remote_branch"
