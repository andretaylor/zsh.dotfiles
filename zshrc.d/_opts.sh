#!/bin/zsh

# https://zsh.sourceforge.io/Doc/Release/Options.html

setopt NO_CASE_GLOB #Case Insensitive Globbing
setopt AUTO_CD #Automatic CD
setopt EXTENDED_HISTORY #

unsetopt SHARE_HISTORY # Turn off shared history

# https://github.com/ricbra/zsh-config/blob/master/zshrc