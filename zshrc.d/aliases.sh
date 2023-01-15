#!/bin/zsh

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# Directories
alias dl="cd ${HOME}/Downloads"
alias dt="cd ${HOME}/Desktop"
alias prj="${HOME}/Documents/projects"

# List
alias lc="ll -tcr"                                            # Sort by/show change time,most recent last
alias lf="ls -1"                                              # List just filenames, 1 per line
alias lk="ll -Sr"                                             # Sort by size, biggest last
alias ll="ls -al"                                             # List all files
alias lt="ll -tr"                                             # Sort by date, most recent last
alias lu="ll -tur"                                            # Sort by/show access time, most recent last

# Filesystem operations
alias cp="cp -iR"                                             # Recursive copy directory entries. Prompt for confirmation
alias df="df -kh"                                             # Displays free disk space
alias du="du -kh"                                             # Displays disk usage stats in more readable output
alias ft="tree_view"                                          # Display directory contents in a tree view
alias mv="mv -i"                                              # Move directory entries. Prompt for confirmation
alias path="echo -e ${PATH//:/\\\n}"                          # Pretty-print of PATH variables
alias rm="rm -i"                                              # Remove directory entries. Prompt for confirmation
alias rmf!="rm -Rf"                                           # Recursive remove directory entries with force
alias which="type -a"                                         # Locate a program in user path

# Shell
alias c="clear"                                               # Clear screen
alias hh="history"                                            # CL history
alias grep='grep --color=auto'

# System
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias pm="sudo powermetrics"                                  # Display system power metrics
alias pmct='sudo powermetrics -s smc | grep -i "CPU die temperature"' # Display CPU temperature
alias pmtl="pmset -g thermlog"                                # Display thermal log
alias pmtp="sudo powermetrics -s thermal | grep -A2 -i thermal"       # Display thermal pressure
alias rpw="password_generator"                                # Generate random base64 password

#-------------------------------------------------------------
# GIT aliases
#-------------------------------------------------------------

# Branch
alias gbm="git branch --merged"                               # List branches whose tips are reachable from HEAD
alias gcop="git checkout -"                                   # Checkout previous branch
alias gcor="git checkout -- ."                                # Remove unstaged files
alias ggff="git push --force-with-lease"                      # Protect all remote refs that are going to be updated
alias gstm="git stash push -m"                                # Stash push with message
alias gcanf!="gcan! && ggff"                                  # Amend commit no edit && force push with lease

# Miscellaneous
alias gita="alias | grep \=\'git"                             # List GIT aliases
alias gly="gl && yarn"                                        # Git latest and run yarn
# Status
alias gsso="git show --stat --oneline"                        # Show status of files in HEAD or SHA
