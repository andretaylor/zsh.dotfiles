#!/bin/zsh

#-------------------------------------------------------------
# Re/Load shell
#
# Globals:
#   None
# Arguments:
#   None
# Alias:
#  `reload`
# Example:
#  `load_shell`
#  `reload`
#-------------------------------------------------------------

function load_shell() {
  typeset -a shell_files

  # Configuration files are order dependant
  shell_files+="${ZDOTDIR}/.zshenv"
  shell_files+="${ZDOTDIR}/.zprofile"
  shell_files+="${ZDOTDIR}/.zshrc"
  shell_files+="${ZDOTDIR}/.zlogin"
  shell_files+="${ZDOTDIR}/.zlogout"

  for shell_file in $shell_files[@]; do
    if [[ -s "${shell_file}" ]]; then
      echo "${COLOR_YELLOW}Loading:${COLOR_RESET} ${shell_file}"
      source "${shell_file}"
    fi
  done
}

alias reload="load_shell"