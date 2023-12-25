#!/bin/bash
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

  printf "Local IP: \t%s%s%s\n" \
    "${COLOR_YELLOW}" \
    "${local_ip}" \
    "${COLOR_RESET}"

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
