#!/bin/zsh

#-------------------------------------------------------------
# Prints current date and time as a string
#
# Globals:
#   None
# Arguments:
#   None
# Example:
#   `date_string` - Prints `01172022-000115``
#-------------------------------------------------------------

function date_string() {
  echo "$(date +%m%d%Y-%H%M%S)";
}