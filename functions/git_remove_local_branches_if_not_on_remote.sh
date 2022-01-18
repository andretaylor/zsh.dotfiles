#!/bin/zsh

#-------------------------------------------------------------
# Remove local branch if it does not exist on remote
#
# Globals:
#   None
# Arguments:
#   $1 - Local branch name to delete
# Alias:
#   `gkbleach`
# Example:
#   `git_remove_local_branches_if_not_on_remote branch-to-delete`
#   `gkbleach branch-to--delete`
#-------------------------------------------------------------

function git_remove_local_branches_if_not_on_remote() {
  if [[ -n "${1}" ]]; then
    git checkout main &&
    git pull &&
    git remote prune origin &&
    git branch --merged \
      | egrep -v "(^\*|main|dev)" \
      | xargs git branch -d origin/
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkbleach="git_remove_local_branches_if_not_on_remote"