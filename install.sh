#!/bin/zsh

#-------------------------------------------------------------
# Backup files
#-------------------------------------------------------------
setopt extended_glob

zsh_files=(
  ${ZDOTDIR:-$HOME}/.zlogin(.N)
  ${ZDOTDIR:-$HOME}/.zlogout(.N)
  ${ZDOTDIR:-$HOME}/.zprofile(.N)
  ${ZDOTDIR:-$HOME}/.zsh_history(.N)
  ${ZDOTDIR:-$HOME}/.zshenv(.N)
  ${ZDOTDIR:-$HOME}/.zshrc(.N)
)

backup_directory="${HOME}/.zsh_bak_`(date +%Y%m%d-%H%M%S)`"
mkdir -p "${backup_directory}"

for zsh_file in $zsh_files; do
  cp $zsh_file "${backup_directory}"
done

unset backup_directory zsh_file zsh_files
unsetopt extended_glob

#-------------------------------------------------------------
# Symlink .zshenv
#-------------------------------------------------------------

# ln -s ${HOME}/.config/zsh/.zshenv ${HOME}/.zshenv
ln -s ${ZDOTDIR:-"${HOME}/.config/zsh/.zshenv"} ${HOME}/.zshenv
