#!/bin/bash

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

#------------------------------------------------------------------------------
# Print list of GIT CL prompt symbols
#
# Globals:
#   None
# Arguments:
#   None
# Example:
#   `git_cl_symbols`
# Alias:
#   `gits`
#------------------------------------------------------------------------------

function git_cl_symbols() {
  echo
  echo "     ___________________________________________________________"
  echo "     | Symbol |  Meaning                                       |"
  echo "     -----------------------------------------------------------"
  echo "     | ⇣42    |  This many commits behind the remote           |"
  echo "     | ⇡42    |  This many commits ahead of the remote         |"
  echo "     | ⇠42    |  This many commits behind the push remote      |"
  echo "     | ⇢42    |  This many commits ahead of the push remote    |"
  echo "     | *42    |  This many stashes                             |"
  echo "     | merge  |  Repository state                              |"
  echo "     | ~42    |  This many merge conflicts                     |"
  echo "     | +42    |  This many staged changes                      |"
  echo "     | !42    |  This many unstaged changes                    |"
  echo "     | ?42    |  This many untracked files                     |"
  echo "     -----------------------------------------------------------"
  echo
}

alias gits="git_cl_symbols"

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

#------------------------------------------------------------------------------
# Delete remote and local branch
#
# Globals:
#   None
# Arguments:
#   $1 - Branch name to delete
# Example:
#   `git_delete_local_and_remote_branch branch-name-to-delete`
#   `gkdestroy branch-name-to-delete`
# Alias:
#   `gkdestroy`
#------------------------------------------------------------------------------

function git_delete_local_and_remote_branch() {
  if [[ -n "${1}" ]]; then
    git push origin --delete "${1}"
    git branch -D "${1}"
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkdestroy="git_delete_local_and_remote_branch"

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

#------------------------------------------------------------------------------
# Prune all unreachable objects
# Remove local branch if it does not exist on remote
# Cleanup local repository
# Globals:
#   None
# Arguments:
#   None
# Example:
#   `git_does_branch_exist_on_remote`
#   `gkclean`
# Alias:
#   `gkclean`
#------------------------------------------------------------------------------

function git_prune_and_clean_local_repository() {
  git checkout main &&
    git pull &&
    git remote prune origin &&
    git branch --merged |
    grep -E -v "(^\*|main|dev)" |
      xargs git branch -d &&
    git gc
}

alias gkclean="git_prune_and_clean_local_repository"

#------------------------------------------------------------------------------
# Remove local branch with force
#
# Globals:
#   None
# Arguments:
#   $1 - local branch name to delete
# Example:
#   `git_remove_local_branch_with_force branch-to-forcefully-delete`
#   `gkremovel branch-to-forcefully-delete`
# Alias:
#   `gkremovel`
#------------------------------------------------------------------------------

function git_remove_local_branch_with_force() {
  if [[ -n "${1}" ]]; then
    git branch --delete --force "${1}"
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Branch name needed!"
  fi
}

alias gkremovel="git_remove_local_branch_with_force"

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
