#!/bin/bash
#------------------------------------------------------------------------------
# Display current directory in tree view with pagination
#
# @param {number} $1 - Number of levels deep (default: 3)
# @param {string} $2 - Path to directory (default: current directory)
# @return {string} - Tree view of current directory

# Usage:
#   `tree_view` - Display tree 3 (default) levels deep with hidden files and color
#   `tree_view 5` - Display tree 5 levels deep
# Alias:
#  `t`
#------------------------------------------------------------------------------

function tree_view() {
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst -L "${1:-3}" -aC $2 | less
}

alias t="tree_view"
