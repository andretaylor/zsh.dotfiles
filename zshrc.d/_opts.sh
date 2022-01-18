#!/bin/zsh

setopt NO_CASE_GLOB #Case Insensitive Globbing
setopt AUTO_CD #Automatic CD
setopt EXTENDED_HISTORY #
# Correction
setopt CORRECT
setopt CORRECT_ALL
# Turn off shared history
unsetopt share_history

# https://github.com/ricbra/zsh-config/blob/master/zshrc