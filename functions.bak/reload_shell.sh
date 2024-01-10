#!/bin/bash
#------------------------------------------------------------------------------
# Reload shell
#
# @example - `reload_shell`
# @alias - `reload`
#------------------------------------------------------------------------------

function reload_shell() {
  typeset -a shell_files

  local load_shell_file_start_time
  local reload_shell_start_time

  # Start script execution timer
  reload_shell_start_time=$(gdate +%s%N)

  # Configuration files are order dependant
  shell_files+=("${ZDOTDIR}"/.zshenv)
  shell_files+=("${ZDOTDIR}"/.zprofile)
  shell_files+=("${ZDOTDIR}"/.zshrc)
  shell_files+=("${ZDOTDIR}"/.zlogin)
  shell_files+=("${ZDOTDIR}"/.zlogout)

  # Clear terminal
  clear

  # Load colors
  source "${ZDOTDIR}/zshenv.d/colors.sh"

  for shell_file in "${shell_files[@]}"; do
    if [[ -s "${shell_file}" ]]; then
      load_shell_file_start_time=$(gdate +%s%N)

      printf "Reloading: %s%s%s - " "${COLOR_YELLOW}" "${shell_file}" "${COLOR_RESET}"

      source "${shell_file}" &&
        printf "%sDone (%ss)%s\n" \
          "${COLOR_GREEN}" \
          "$(elapsed_time "${load_shell_file_start_time}" "$(gdate +%s%N)")" \
          "${COLOR_RESET}" ||
        printf "%sFailed (%ss)%s\n" \
          "${COLOR_RED}" \
          "$(elapsed_time "${load_shell_file_start_time}" "$(gdate +%s%N)")" \
          "${COLOR_RESET}"
    fi
  done

  printf "\n%sShell Reloaded (%ss)%s\n" \
    "${COLOR_GREEN}" \
    "$(elapsed_time "${reload_shell_start_time}" "$(gdate +%s%N)")" \
    "${COLOR_RESET}"

  unset shell_file
  unset shell_files
}

alias reload="reload_shell"
