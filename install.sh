#!/bin/bash

#------------------------------------------------------------------------------
# Backup files
#------------------------------------------------------------------------------
# setopt extended_glob

zsh_files=(
  ".zshenv"
  ".zprofile"
  ".zshrc"
  ".zlogin"
  ".zlogout"
  ".zsh_history"
)

#back up files
# backup_directory="${HOME}/.zsh_bak_$(date +%Y%m%d-%H%M%S)"
# mkdir -p "${backup_directory}"

# for zsh_file in "${zsh_files[@]}"; do
#   mv "${ZDOTDIR:-$HOME}/${zsh_file}" "${backup_directory}"
# done

#------------------------------------------------------------------------------
# Symlink .zshenv
#------------------------------------------------------------------------------

for zsh_file in "${zsh_files[@]}"; do
  ln -s "${HOME}/.config/zsh/${zsh_file}" "${HOME}/${zsh_file}"
done

# unset backup_directory
unset zsh_file
unset zsh_files

# unsetopt extended_glob
