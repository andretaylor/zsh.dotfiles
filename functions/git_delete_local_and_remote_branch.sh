#!/bin/zsh

#-------------------------------------------------------------
# Delete remote and local branch
#
# Globals:
#   None
# Arguments:
#   $1 - Branch name to delete
# Alias:
#   `gkdestroy`
# Example:
#   `git_delete_local_and_remote_branch branch-name-to-delete`
#   `gkdestroy branch-name-to-delete`
#-------------------------------------------------------------

function git_delete_local_and_remote_branch() {
  if [[ -n "${1}" ]]; then
    git push origin --delete ${1} &&
    git branch -D ${1}
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkdestroy="git_delete_local_and_remote_branch"