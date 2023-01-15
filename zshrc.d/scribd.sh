#!/bin/zsh

#-------------------------------------------------------------
# Environment variables
#-------------------------------------------------------------
export PATH="${PATH}:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"

export readonly DEVKUBE_MONO_SYNC="${HOME}/.devkube/devkube_config_custom.yaml"
export readonly SCNP_DIR="${HOME}/Documents/scribd/git/scribd/npm-packages"
export readonly SCSC_DIR="${HOME}/Documents/scribd/git/scribd/scribd"

#-------------------------------------------------------------
# Functions
#-------------------------------------------------------------
function devkube_frontend_watch() {
  if [[ -n "${1}" ]]; then
    devkube frontend watch -apps=${1}
  else
    devkube frontend watch --watch-all
  fi
}

function mono_sync() {
  if [[ -f "${HOME}/.devkube/devkube_config_custom.yaml.disabled" ]]; then
    print_header "Enabling mono sync"
    mv ${DEVKUBE_MONO_SYNC}{.disabled,}
  else
    print_header "Disabling mono sync"
    mv ${DEVKUBE_MONO_SYNC}{,.disabled}
  fi
}

#-------------------------------------------------------------
# Aliases
#-------------------------------------------------------------

# Devkube
# alias dkfwa="devkube frontend watch --watch-all"              # Watch webpack for future builds
alias dkdev="devkube init --cluster dev"                      # Create a new dev cluster
alias dkfw="devkube_frontend_watch"                           # Watch webpack for future builds
alias dklist="devkube cluster list"                           # List current clusters
alias dklogs="devkube logs"                                   # devkube logs: Now shows logs for any services, not just rails.
alias dkms="mono_sync"                                        # Enable/Disable Devkube Mono Sync
alias dknew="devkube init --cluster"                          # Create a new cluster
alias dkr="devkube restart"                                   # devkube restart: Now restarts any service, not just rails
alias dkrm="devkube cluster delete"                           # Remove a cluster
alias dkrr="devkube restart rails"                            # devkube restart rails service
alias dkstatus="devkube status"                               # devkube status: Now shows statuses for all services, not just rails.
alias dkswap="devkube cluster set"                            # Switch to a different cluster
alias dkup="devkube init"                                     # Initialize devkube

# Directories
alias scnp="cd $SCNP_DIR"                                     # Change directory to npm-packages repo
alias scsc="cd $SCSC_DIR"                                     # Change directory to scribd repo

alias scsce="cd ${SCSC_DIR}/end2end"                          # Change directory to end2end
alias scwam="cd ${SCSC_DIR}/webpack/account-management"       # Change directory to account-management package
alias scwcp="cd ${SCSC_DIR}/webpack/content-preview"          # Change directory to content-preview package
alias scwd="cd ${SCSC_DIR}/webpack/doc_page"                  # Change directory to doc_page package
alias scwe="cd ${SCSC_DIR}/webpack/explore"                   # Change directory to explore package
alias scwlp="cd ${SCSC_DIR}/webpack/landing-pages"            # Change directory to search package
alias scwm="cd ${SCSC_DIR}/webpack/monolith"                 # Change directory to monolith package
alias scws="cd ${SCSC_DIR}/webpack/search"                    # Change directory to search package

# Miscellaneous
alias sbi="bundle install --full-index; yarn"                 # Install latest gems and node_modules
alias ssb="yarn storybook"                                    # Launch storybook
alias ssbm="scsc; yarn storybook"                             # Launch monolith storybook
alias stw="yarn test:watch"                                   # Test watch
alias stwv="stw --verbose"                                    # Test watch verbose
alias stwa="yarn test:watch --watchAll"                       # Test watch all
alias stwav="stwa --verbose"                                  # Test watch all verbose
