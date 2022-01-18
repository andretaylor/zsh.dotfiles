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

export readonly IS_SCRIBD="IS_SCRIBD"
export readonly NVM_DIR="${HOME}/.nvm"
export readonly RAND=$(openssl rand -hex 10)
export readonly ZSH="${HOME}/.oh-my-zsh" # Path to your oh-my-zsh installation.

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


# Load NVM
if [[ -s "${NVM_DIR}/nvm.sh" ]]; then
 source "${NVM_DIR}/nvm.sh"
fi

# Load NVM bash_completion
if [[ -s "${NVM_DIR}/bash_completion" ]]; then
  source "${NVM_DIR}/bash_completion"
fi

#-------------------------------------------------------------
# Ruby environmental variables
#-------------------------------------------------------------
source /usr/local/opt/chruby/share/chruby/chruby.sh &&
  source /usr/local/opt/chruby/share/chruby/auto.sh &&
  chruby  ruby-2.4.7


# https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
# if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -t __init_nvm)" = function ]; then
#   export NVM_DIR="$HOME/.nvm"

#   [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

#   declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')

#   function __init_nvm() {
#     for i in "${__node_commands[@]}"; do unalias $i; done
#     . "$NVM_DIR"/nvm.sh
#     unset __node_commands
#     unset -f __init_nvm
#   }

#   for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
# fi
