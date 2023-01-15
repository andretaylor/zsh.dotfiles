#!/bin/zsh

#-------------------------------------------------------------
# Prune all unreachable objects
# Remove local branch if it does not exist on remote
# Cleanup local repository
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
  git branch --merged \
    | egrep -v "(^\*|main|dev)" \
    | xargs git branch -d &&
  git gc
}

alias gkclean="git_prune_and_clean_local_repository"