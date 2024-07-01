#!/bin/zsh
#------------------------------------------------------------------------------
# Used for login shells and is executed before the initial command prompt.
#
# This phase is dedicated to login shells and is executed prior to the display
# of the initial command prompt.
#
# It serves as the appropriate space for configuring items that need to be set
# once or those that don't require frequent updates. This includes extending
# the $PATH environment variables, establishing necessary directories, and
# sourcing additional shell scripts.
#
# Load order: .zshenv → [.zprofile] → .zshrc → .zlogin → .zlogout
#------------------------------------------------------------------------------

#-[ Environmental variables ]--------------------------------------------------
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"                    # Path to nvm installation
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"    # non-essential data
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}" # user-specific configuration
export ZSH="${ZSH:-$HOME/.oh-my-zsh}"                      # Path to oh-my-zsh installation

# Define the PATH variable
path=(
  $path
  ${HOME}
  ${HOME}/bin
  /usr/local/bin
  ${HOME}/.yarn/bin
  ${HOME}/.config/yarn/global/node_modules/.bin
  ${HOME}/Library
  ${ZSH}
)

#------------------------------------------------------------------------------
# Loads the Zsh configuration file for non-interactive shells.
#------------------------------------------------------------------------------
function setup_non_interactive_shell_env() {
  if [[ ("${SHLVL}" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprofile"
  fi
}

#------------------------------------------------------------------------------
# Load zprofile files
#
# This function loads all files in the zprofile.d directory.
#------------------------------------------------------------------------------
function load_zprofile_files() {
  local zprofile_file

  for zprofile_file in "${ZDOTDIR}"/zprofile.d/*; do
    if [[ -s "${zprofile_file}" ]]; then
      source "${zprofile_file}"
    fi
  done

  unset zprofile_file
}

#------------------------------------------------------------------------------
# Load zprofile functions
#
# This function loads all files in the functions directory.
#------------------------------------------------------------------------------
function load_zprofile_functions() {
  local zprofile_functions

  for zprofile_functions in "${ZDOTDIR}"/functions/*; do
    if [[ -s "${zprofile_functions}" ]]; then
      source "${zprofile_functions}"
    fi
  done

  unset zprofile_functions
}

setup_non_interactive_shell_env
load_zprofile_files
load_zprofile_functions

unset setup_non_interactive_shell_env
unset load_zprofile_files
unset load_zprofile_functions
