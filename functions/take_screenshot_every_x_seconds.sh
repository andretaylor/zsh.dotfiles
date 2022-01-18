#!/bin/zsh

#-------------------------------------------------------------
# Take a screenshot every n seconds
#
# Globals:
#   None
# Arguments:
#   $1 - Number of seconds to wait between screenshots
# Alias:
#  `creep`
# Example:
#   `take_screenshot_every_n_seconds` - Take screenshot using
#       default wait time
#   `creep 25` - Take a screenshot every 25 seconds
#-------------------------------------------------------------

function take_screenshot_every_n_seconds() {
    local seconds_to_wait="${1:-15}";

    while :; do;
        echo "📸" $(date +%H:%M:%S); screencapture -x ~/Screenshots/$(date +%s).png; sleep "${seconds_to_wait}";
    done
}

alias creep="take_screenshot_every_x_seconds"