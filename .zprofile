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

#-[ Environmental variables ]-------------------------------------------------
readonly NVM_DIR="${NVM_DIR:-${HOME}/.nvm}" # Path to nvm installation
readonly ZSH="${ZSH:-${HOME}/.oh-my-zsh}"   # Path to oh-my-zsh installation

export NVM_DIR
export ZSH
export PATH="${PATH}:${HOME}:${HOME}/bin:/usr/local/bin:${HOME}/Library"

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

load_zprofile_files
load_zprofile_functions

unset load_zprofile_files
unset load_zprofile_functions
