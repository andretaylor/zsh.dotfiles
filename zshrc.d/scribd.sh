#!/bin/zsh

#-------------------------------------------------------------
# Environment variables
#-------------------------------------------------------------
export PATH="${PATH}:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"

export readonly SCNP_DIR="${HOME}/Documents/scribd/git/scribd/npm-packages"
export readonly SCSC_DIR="${HOME}/Documents/scribd/git/scribd/scribd"

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Devkube
alias dkup="devkube init"                                     # Initialize devkube
alias dknew="devkube init --cluster"                          # Create a new cluster
alias dkswap="devkube cluster set"                            # Switch to a different cluster
alias dkrm="devkube cluster delete"                           # Remove a cluster
alias dklist="devkube cluster list"                           # List current clusters
alias dkfw="devkube frontend watch"                           # Watch webpack for future builds
alias dklogs="devkube logs"                                   # devkube logs: Now shows logs for any services, not just rails.
alias dkstatus="devkube status"                               # devkube status: Now shows statuses for all services, not just rails.
alias dkrestart="devkube restart"                             # devkube restart: Now restarts any service, not just rails.

# Directories
alias scnp="cd $SCNP_DIR"                                     # Change directory to npm-packages repo
alias scsc="cd $SCSC_DIR"                                     # Change directory to scribd repo
alias scwd="cd ${SCSC_DIR}/webpack/doc_page"                  # Change directory to doc_page package
alias scscm="cd ${SCSC_DIR}/webpack/monolith"                 # Change directory to monolith package
alias scsce="cd ${SCSC_DIR}/end2end"                          # Change directory to end2end
alias scwam="cd ${SCSC_DIR}/webpack/account-management"       # Change directory to account-management package
alias scwcp="cd ${SCSC_DIR}/webpack/content-preview"          # Change directory to content-preview package
alias scws="cd ${SCSC_DIR}/webpack/search"                    # Change directory to search package
alias scwe="cd ${SCSC_DIR}/webpack/explore"                   # Change directory to explore package

# Miscellaneous
alias sbi="bundle install --full-index; yarn"                 # Install latest gems and node_modules
alias ssb="yarn storybook"                                    # Launch storybook
alias ssbm="scsc; yarn storybook"                             # Launch monolith storybook
alias stw="yarn test:watch"                                   # Test watch
alias stwa="yarn test:watch --watchAll"                       # Test watch all
