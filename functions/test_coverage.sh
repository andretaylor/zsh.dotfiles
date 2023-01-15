#!/bin/zsh

#-------------------------------------------------------------
# Run unit test coverage report
#
# Globals:
#   None
# Arguments:
#   $1 - Regex file pattern
# Alias:
#  `stc`
# Example:
#   `test_coverage` - Run coverage report
#   `stc Component.spec.js` - Run coverage on Component.spec.js
#-------------------------------------------------------------

function test_coverage() {
  local -r report_file="/coverage/index.html"

  if [ -n "${1}" ]; then
    echo "${COLOR_YELLOW}Pattern:${COLOR_RESET} ${1}"

    yarn test ${1} --coverage; open .${report_file}
  else
    yarn test:coverage; open .${report_file}
  fi
}

alias stc="test_coverage"