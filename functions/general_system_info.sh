#!/bin/zsh

#-------------------------------------------------------------
# Prints general system info
#
# Globals:
#   None
# Arguments:
#   None
# Alias:
#   `ii`
#-------------------------------------------------------------

function general_system_info() {
  clear
  echo
  echo "${fg[yellow]}Current date:${reset_color} " ; date
  echo "${fg[yellow]}Machine stats:${reset_color} " ; uptime
  echo "${fg[yellow]}Memory stats:${reset_color} " ; top -l 1 \
    | head -n 10 \
    | grep PhysMem
  echo "${fg[yellow]}Disk space:${reset_color} " ; df /
  echo "${fg[yellow]}External IP:${reset_color} "; dig +short myip.opendns.com @resolver1.opendns.com
  echo "${fg[yellow]}Internal IP(s):${reset_color} " ; ifconfig \
    | grep 'inet ' \
    | grep -v 127.0.0.1 \
    | cut -d: -f2 \
    | awk '{print $2}'
  echo "${fg[yellow]}Name servers:${reset_color} " ; cat /etc/resolv.conf | grep nameserver
  echo "${fg[yellow]}Internet speed test: ${reset_color}" ; curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
  echo
}

alias ii="general_system_info"