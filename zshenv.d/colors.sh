#!/bin/bash
printf "Loading colors\n"
readonly COLOR_RED=${fg[red]:-"\e[31m"}
readonly COLOR_GREEN=${fg[green]:-"\e[32m"}
readonly COLOR_YELLOW=${fg[yellow]:-"\e[33m"}
readonly COLOR_BLUE=${fg[blue]:-"\e[34m"}
readonly COLOR_MAGENTA=${fg[magenta]:-"\e[35m"}
readonly COLOR_CYAN=${fg[cyan]:-"\e[36m"}
readonly COLOR_RESET=${reset_color:-"\e[0m"}

export COLOR_RED
export COLOR_GREEN
export COLOR_YELLOW
export COLOR_BLUE
export COLOR_MAGENTA
export COLOR_CYAN
export COLOR_RESET
