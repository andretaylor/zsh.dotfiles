#!/bin/zsh

#-------------------------------------------------------------
# Make directory and change into it
#
# Globals:
#   $USER
# Arguments:
#   $@
# Alias:
#   `myps`
# Example:
#   `my_system_processes`
#   `myps`
#-------------------------------------------------------------

# Show My Processes
function my_system_processes() {
  ps $@ -u $USER -o pid,%cpu,%mem,command
}

alias myps="my_system_processes"