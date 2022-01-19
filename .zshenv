#!/bin/zsh

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "${SHLVL}" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
