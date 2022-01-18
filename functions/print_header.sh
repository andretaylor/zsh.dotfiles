#!/bin/zsh

#-------------------------------------------------------------
# Print ascii header with decorative separators
#
# Globals:
#   None
# Arguments:
#   $1 - Header text
# Example:
#   `printer_header "This is a header"`
#-------------------------------------------------------------

function print_header() {
  local -r STRING_LENGTH=$(($(echo -n $1 | wc -m) + 4 ))

  _separator() {
    echo "${$( printf "%${STRING_LENGTH}s" )// /-}"
  }

  _separator
  echo "| ${1} |"
  _separator
}