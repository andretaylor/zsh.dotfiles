#!/bin/zsh

#------------------------------------------------------------------------------
# Show My Processes
#
# Globals:
#   $USER
# Arguments:
#   $@
# Example:
#   `my_system_processes`
#   `myps`
# Alias:
#   `myps`
#------------------------------------------------------------------------------

# Show My Processes
function my_system_processes() {
  ps "${@}" -u "${USER}" -o pid,%cpu,%mem,command
}

alias myps="my_system_processes"
