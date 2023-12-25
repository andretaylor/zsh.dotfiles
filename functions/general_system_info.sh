#!/bin/bash

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
