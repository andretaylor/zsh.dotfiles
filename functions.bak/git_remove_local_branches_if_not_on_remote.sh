#!/bin/zsh

#------------------------------------------------------------------------------
# Remove local branch if it does not exist on remote
#
# Globals:
#   None
# Arguments:
#   $1 - Local branch name to delete
# Example:
#   `git_remove_local_branches_if_not_on_remote branch-to-delete`
#   `gkbleach branch-to--delete`
# Alias:
#   `gkbleach`
#------------------------------------------------------------------------------

function git_remove_local_branches_if_not_on_remote() {
  git checkout main &&
    git pull &&
    git branch --merged |
    grep -E -v "(^\*|main|dev)" |
      xargs git branch -d
}

alias gkbleach="git_remove_local_branches_if_not_on_remote"
