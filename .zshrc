#!/bin/zsh

#-------------------------------------------------------------
# .zshrc is for interactive shell configuration.
#
# You set options for the interactive shell with the
# setopt and unsetopt commands. You can also load shell
# modules, set your history options, change your prompt,
# set up zle and completion, et cetera. You also set any
# variables that are only used in the interactive shell.
#
# Load order:
#   .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
#-------------------------------------------------------------

for zshrc_file in $ZDOTDIR/zshrc.d/*; do
  if [[ -s "${zshrc_file}" ]]; then
    source "${zshrc_file}"
  fi
done

unset zshrc_file
test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

