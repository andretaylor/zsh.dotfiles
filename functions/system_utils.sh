#!/bin/bash
#------------------------------------------------------------------------------
# Prints current date and time as a string
#
# @example - `date_string`
# @return {string} - Current date and time as a string
#------------------------------------------------------------------------------

function date_string() {
  date +%m%d%Y-%H%M%S
}

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


#------------------------------------------------------------------------------
# Prints general system info
#
# Globals:
#   None
# Arguments:
#   None
# Alias:
#   `ii`
#------------------------------------------------------------------------------

function general_system_info() {
  clear

  echo
  echo "${COLOR_YELLOW}Current date:${COLOR_RESET} "
  date

  echo "${COLOR_YELLOW}Machine stats:${COLOR_RESET} "
  uptime

  echo "${COLOR_YELLOW}Memory stats:${COLOR_RESET} "
  top -l 1 |
    head -n 10 |
    grep PhysMem

  echo "${COLOR_YELLOW}Disk space:${COLOR_RESET} "
  df /

  echo "${COLOR_YELLOW}External IP:${COLOR_RESET} "
  dig +short myip.opendns.com @resolver1.opendns.com

  echo "${COLOR_YELLOW}Internal IP(s):${COLOR_RESET} "
  ifconfig |
    grep 'inet ' |
    grep -v 127.0.0.1 |
    cut -d: -f2 |
    awk '{print $2}'

  echo "${COLOR_YELLOW}Name servers:${COLOR_RESET} "
  cat /etc/resolv.conf | grep nameserver

  echo "${COLOR_YELLOW}Internet speed test: ${COLOR_RESET}"
  # curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip

  # requires npm install --global fast-cli
  echo
}

alias ii="general_system_info"


#------------------------------------------------------------------------------
# Make directory and change into it
#
# Arguments: $1 - Name of new directory
# Example:
#   `make_directory_and_change_into_directory new-directory-name`
#   `mcd new-directory-name`
# Alias: `mcd`
#------------------------------------------------------------------------------

function make_directory_and_change_into_directory() {
  if [[ -n "${1}" ]]; then
    mkdir -p "${1}" && cd "${1}" || return
  else
    echo "${COLOR_RED}Error:${COLOR_RESET} Directory name needed!"
  fi
}

alias mcd="make_directory_and_change_into_directory"

#------------------------------------------------------------------------------
# Prints local IP, public IP, and IPv6 addresses
#
# @example - `my_ip`
# @return {string} - Local IP, public IP, and IPv6 addresses
#------------------------------------------------------------------------------

function my_ip() {
  local local_ip
  local public_ip
  local public_ipv6

  local_ip=$(ipconfig getifaddr en0)
  public_ip=$(dig +short txt ch whoami.cloudflare @1.0.0.1 | tr -d "\"")
  public_ipv6=$(dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d "\"")

  printf "%sLocal IP:%s \t%s\n" \
    "${COLOR_YELLOW}" \
    "${COLOR_RESET}" \
    "${local_ip}"

  printf "Public IP: \t%s%s%s\n" \
    "${COLOR_YELLOW}" \
    "${public_ip}" \
    "${COLOR_RESET}"

  printf "Public IPv6: \t%s%s%s\n" \
    "${COLOR_YELLOW}" \
    "${public_ipv6}" \
    "${COLOR_RESET}"

  unset local_ip
  unset public_ip
  unset public_ipv6
}


#------------------------------------------------------------------------------
# Show My Processes
#
# Globals:
#   $USER
# Arguments:
#   $@
# Example:
#   `my_system_processes`
#   `myps`
# Alias:
#   `myps`
#------------------------------------------------------------------------------

# Show My Processes
function my_system_processes() {
  ps "${@}" -u "${USER}" -o pid,%cpu,%mem,command
}

alias myps="my_system_processes"


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

#------------------------------------------------------------------------------
# Print ascii header with decorative separators
#
# Arguments: $1 - Header text
# Example: `printer_header "This is a header"`
#------------------------------------------------------------------------------

function print_header() {
  local -r STRING_LENGTH=$(($(echo -n "${1}" | wc -m) + 4 ))

  _separator() {
    echo "${$( printf "%${STRING_LENGTH}s" )// /-}"
  }

  _separator
  echo "| ${1} |"
  _separator
}


#------------------------------------------------------------------------------
# Take a screenshot every n seconds
#
# Globals:
#   None
# Arguments:
#   $1 - Number of seconds to wait between screenshots
# Example:
#   `take_screenshot_every_n_seconds` - Take screenshot using default wait time
#   `creep 25` - Take a screenshot every 25 seconds
# Alias:
#  `creep`
#------------------------------------------------------------------------------

function take_screenshot_every_n_seconds() {
    local seconds_to_wait="${1:-15}"

    while :; do
        echo "📸" "$(date +%H:%M:%S)"
        screencapture -x ~/Screenshots/"$(date +%s)".png
        sleep "${seconds_to_wait}"
    done
}

alias creep="take_screenshot_every_x_seconds"

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
