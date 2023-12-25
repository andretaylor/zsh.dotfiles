#!/bin/bash

#-[ Zsh Configuration ]--------------------------------------------------------

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k" # Set name of the theme to load

# Plugins
plugins=(
  aliases
  git
)

# Load OH-MY-ZSH
source ${ZSH}/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -f ${HOME}/.p10k.zsh ]]; then
  source ${HOME}/.p10k.zsh
fi
