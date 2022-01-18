#!/bin/zsh

#-------------------------------------------------------------
# Prune all unreachable objects and cleanup local repository
#
# Globals:
#   None
# Arguments:
#   None
# Alias:
#   `gkclean`
# Example:
#   `git_does_branch_exist_on_remote`
#   `gkclean`
#-------------------------------------------------------------

function git_prune_and_clean_local_repository() {
  git checkout main &&
  git pull &&
  git remote prune origin &&
  git gc
}

alias gkclean="git_prune_and_clean_local_repository"