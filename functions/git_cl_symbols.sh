#!/bin/zsh

#-------------------------------------------------------------
# Print list of GIT CL prompt symbols
#
# Globals:
#   None
# Arguments:
#   None
# Alias:
#   `gits`
# Example:
#   `git_cl_symbols`
#   `gits`
#-------------------------------------------------------------

function git_cl_symbols () {
  echo
  echo "     ___________________________________________________________"
  echo "     | Symbol |  Meaning                                       |"
  echo "     -----------------------------------------------------------"
  echo "     | ⇣42    |  This many commits behind the remote           |"
  echo "     | ⇡42    |  This many commits ahead of the remote         |"
  echo "     | ⇠42    |  This many commits behind the push remote      |"
  echo "     | ⇢42    |  This many commits ahead of the push remote    |"
  echo "     | *42    |  This many stashes                             |"
  echo "     | merge  |  Repository state                              |"
  echo "     | ~42    |  This many merge conflicts                     |"
  echo "     | +42    |  This many staged changes                      |"
  echo "     | !42    |  This many unstaged changes                    |"
  echo "     | ?42    |  This many untracked files                     |"
  echo "     -----------------------------------------------------------"
  echo
}

alias gits="git_cl_symbols"