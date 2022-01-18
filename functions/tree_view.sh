#!/bin/zsh

#-------------------------------------------------------------
# Display current directory in tree view with pagination
#
# Globals:
#   None
# Arguments:
#   $1 - Number of levels deep (default: 3)
#   $2 - Additional arguments
# Alias:
#  `t`
# Example:
#   `tree_view` - Display tree 3 (default) levels deep
#   `t 5` - Display tree 5 levels deep
#-------------------------------------------------------------

function tree_view() {
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst -L ${1:-3} -aC $2 | less
}

alias t="tree_view"