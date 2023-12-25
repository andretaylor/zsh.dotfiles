#!/bin/zsh

#------------------------------------------------------------------------------
# Git utility: Backup branch locally and push to remote
#
# Globals:
#   None
# Arguments:
#   $1 - Branch name to backup
# Example:
#   `gbk branch-name-to-backup`
# Alias:
#   `gbk`
#------------------------------------------------------------------------------

function git_backup_current_branch() {
  if [[ -n "${1}" ]]; then
    local -r branch_name=$(current_branch)--backup-$(date_string)

    git checkout -b "${branch_name}" &&
      git push origin "${branch_name}" &&
      git push --set-upstream origin "${branch_name}"
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gbk="git_backup_current_branch"
