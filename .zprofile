#!/bin/zsh

#-------------------------------------------------------------
# .zprofile is for items which should be set once or which
# don't need to be updated frequently: environment variables,
# data folder location, etc.
#
# Load order:
#   .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#-------------------------------------------------------------

#-------------------------------------------------------------
# Environmental variables
#-------------------------------------------------------------
export PATH="${PATH}:${HOME}:${HOME}/bin:/usr/local/bin:${HOME}/Library"

# export readonly NVM_DIR="${HOME}/.nvm"
# export readonly RAND=$(openssl rand -hex 10)
# # Path to your oh-my-zsh installation.
# export readonly ZSH="${HOME}/.oh-my-zsh"

for zprofile_file in $ZDOTDIR/zprofile.d/*; do
  if [[ -s "${zprofile_file}" ]]; then
    source "${zprofile_file}"
  fi
done
unset zprofile_file

#-------------------------------------------------------------
# Shell functions
#-------------------------------------------------------------
for zprofile_functions in $ZDOTDIR/functions/*; do
  if [[ -s "${zprofile_functions}" ]]; then
    source "${zprofile_functions}"
  fi
done
unset zprofile_functions

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
