#!/bin/bash
#------------------------------------------------------------------------------
# Calculate elapsed time in seconds.
#
# @param {string} $1/start_time - Start time in nanoseconds.
# @param {string} $2/end_time - End time in nanoseconds.
#
# Example: `elapsed_time`
#------------------------------------------------------------------------------
function elapsed_time() {
  local end_time
  local start_time

  start_time="${1}"
  end_time="${2}"

  printf "%s" "$(echo "scale=3;(${end_time} - ${start_time})/(1*10^09)" | bc)"
}
