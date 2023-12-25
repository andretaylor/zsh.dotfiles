#!/bin/zsh
#------------------------------------------------------------------------------
# This section encompasses configuration options related to both the behavior
# and appearance of interactive shells. To tailor the interactive shell
# experience, utilize commands such as `setopt` and `unsetopt`.
# Additionally, you have the flexibility to load shell modules, define history
# preferences, customize your prompt, configure ZLE and completion settings,
# and manage variables exclusive to interactive shell sessions. This includes
# modifications to the shell prompt and aliases.
#
# These configurations are executed automatically each time a new interactive
# shell session is initiated, ensuring that adjustments take effect seamlessly
# upon opening a new terminal window. To maintain optimal performance, refrain
# from incorporating instructions that might contribute to time-consuming
# operations.
#
# Load order: .zshenv → .zprofile → [.zshrc] → .zlogin → .zlogout
#------------------------------------------------------------------------------

#-[ Load zshrc files ]---------------------------------------------------------
function load_zshrc_files() {
  local zshrc_file

  for zshrc_file in "${ZDOTDIR}"/zshrc.d/*; do
    if [[ -s "${zshrc_file}" ]]; then
      source "${zshrc_file}"
    fi
  done

  unset zshrc_file
}

load_zshrc_files
unset load_zshrc_files
