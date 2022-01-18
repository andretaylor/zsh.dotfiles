#!/bin/zsh

#-------------------------------------------------------------
# Remove local branch with force
#
# Globals:
#   None
# Arguments:
#   $1 - local branch name to delete
# Alias:
#   `gkremovel`
# Example:
#   `git_remove_local_branch_with_force branch-to-forcefully-delete`
#   `gkremovel branch-to-forcefully-delete`
#-------------------------------------------------------------

function git_remove_local_branch_with_force() {
  if [[ -n "${1}" ]]; then
    git branch --delete --force ${1}
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkremovel="git_remove_local_branch_with_force"