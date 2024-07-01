#!/bin/zsh
#------------------------------------------------------------------------------
# Prints current date and time as a string
#
# @example - `date_string`
# @return {string} - Current date and time as a string
#------------------------------------------------------------------------------

function date_string() {
  date +%m%d%Y-%H%M%S
}
