#!/bin/bash
#------------------------------------------------------------------------------
# This section houses environment variables that are exported and made
# accessible to other programs within a Zsh session. An example use case
# involves defining specific locations, such as dotfiles paths, for other
# programs to reference.
#
# Load order: [.zshenv] → .zprofile → .zshrc → .zlogin → .zlogout
#------------------------------------------------------------------------------

#-[ Environmental variables ]--------------------------------------------------
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-${HOME}/.cache}    # non-essential data
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config} # user-specific configuration
export ZDOTDIR=${ZDOTDIR:-${HOME}/.config/zsh}             # Zsh configuration directory

#------------------------------------------------------------------------------
# Loads all files in the zshenv.d directory. This is useful for defining
# environment variables that are required by other programs, such as PATH.
#------------------------------------------------------------------------------
function load_zshenv_files() {
  local zshenv_file

  for zshenv_file in "${ZDOTDIR}"/zshenv.d/*; do
    if [[ -s "${zshenv_file}" ]]; then
      source "${zshenv_file}"
    fi
  done

  unset zshenv_file
}

#------------------------------------------------------------------------------
# Loads the Zsh configuration file for non-interactive shells.
#------------------------------------------------------------------------------
function setup_non_interactive_shell_env() {
  if [[ ("${SHLVL}" -eq 1 && ! -o LOGIN) && -s "${ZDOTDIR:-${HOME}}/.zprofile" ]]; then
    source "${ZDOTDIR}/.zprofile"
  fi
}

load_zshenv_files
setup_non_interactive_shell_env
unset load_zshenv_files
unset setup_non_interactive_shell_env
