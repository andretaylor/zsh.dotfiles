#!/bin/zsh

#------------------------------------------------------------------------------
# Open one or more directories. If no arguments supplied,
# opens the current directory, otherwise opens the given
# directory(s)
#
# Globals:
#   None
# Arguments:
#  	$@ - List of directories
# Example:
#  	`open_directory` - open current directory
#  	`o dir1-to-open dir2-to-open` - open directories
# Alias:
#  	`o`
#------------------------------------------------------------------------------

function open_directory() {
	if [ $# -eq 0 ]; then
		open .
	else
		open "${@}"
	fi
}

alias o="open_directory"
