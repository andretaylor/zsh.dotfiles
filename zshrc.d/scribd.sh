#!/bin/bash

#-[ Environment variables ]----------------------------------------------------

export PATH="${PATH}:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin"

readonly SCSC_DIR="${HOME}/Documents/scribd/git/scribd/scribd"
readonly SCNP_DIR="${HOME}/Documents/scribd/git/scribd/npm-packages"
export SCSC_DIR
export SCNP_DIR

#-[ Functions ]----------------------------------------------------------------

code_coverage_diff() {
  # TODO: update so this is more flexible
  # code_root=~/Documents/scribd/git/scribd/scribd
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  print_header "Running test coverage on branch: ${current_branch}"
  cd "$SCSC_DIR/webpack/doc_page" || exit 1
  yarn test --coverage --coverageDirectory ./temp/current_coverage

  printf "\n\n"

  print_header "Get latest from main"
  # switch to main, make sure packages are correct for main branch, get test coverage
  cd "$SCSC_DIR" || exit 1
  git checkout main
  git pull
  # yarn install

  printf "\n\n"

  print_header "Running test coverage on main"
  cd "$SCSC_DIR/webpack/doc_page" || exit 1
  yarn test --coverage --coverageDirectory ./temp/main_coverage

  printf "\n\n"

  # reset to current branch
  print_header "Reset to project branch: ${current_branch}"
  cd "$SCSC_DIR" || exit 1
  git checkout "${current_branch}"
  # yarn install

  cd "$SCSC_DIR/webpack/doc_page" || exit 1

  printf "\n\n"

  # run coverage diff script
  print_header "Run code coverage diff between main and ${current_branch}"
  npm config set @scribd:registry https://scribd.jfrog.io/artifactory/api/npm/npm-local/
  npx @scribd/ci-report-stats-diff \
    --baseBranchName main \
    --baseReportFile ./temp/main_coverage/coverage-summary.json \
    --headBranchName "${current_branch}" \
    --headReportFile ./temp/current_coverage/coverage-summary.json \
    --reportType coverage

  printf "\n\n"
  # cleanup generated coverage files

  print_header "Cleaning up generated files"
  rm -rf ./temp
}

#-[ Aliases ]------------------------------------------------------------------

# Devkube
alias dkdev='devkube init --cluster dev'                                         # Create a new dev cluster
alias dkfw='devkube_frontend_watch'                                              # Watch webpack for future builds
alias dklist='devkube cluster list'                                              # List current clusters
alias dklogs='devkube logs'                                                      # devkube logs: Now shows logs for any services, not just rails.
alias dknew='devkube init --service-groups=monolith-brand-separation  --cluster' # Create a new cluster
alias dkr='devkube restart'                                                      # devkube restart: Now restarts any service, not just rails
alias dkrm='devkube cluster delete'                                              # Remove a cluster
alias dkrr='devkube restart rails'                                               # devkube restart rails service
alias dkstatus='devkube status'                                                  # devkube status: Now shows statuses for all services, not just rails.
alias dkswap='devkube cluster set'                                               # Switch to a different cluster
alias dkup='devkube init'                                                        # Initialize devkube

# Directories
alias scnp='cd $SCNP_DIR'                             # Change directory to npm-packages repo
alias scsc='cd $SCSC_DIR'                             # Change directory to scribd repo
alias sce2e='cd $SCSC_DIR/end2end'                    # Change directory to end2end
alias scwam='cd $SCSC_DIR/webpack/account-management' # Change directory to account-management package
alias scwcp='cd $SCSC_DIR/webpack/content-preview'    # Change directory to content-preview package
alias scwd='cd $SCSC_DIR/webpack/doc_page'            # Change directory to doc_page package
alias scwe='cd $SCSC_DIR/webpack/explore'             # Change directory to explore package
alias scwlp='cd $SCSC_DIR/webpack/landing-pages'      # Change directory to search package
alias scwm='cd $SCSC_DIR/webpack/monolith'            # Change directory to monolith package
alias scws='cd $SCSC_DIR/webpack/search'              # Change directory to search package

# Miscellaneous
alias ysb='yarn storybook'                         # Launch storybook
alias ytw='yarn test:watch'                        # Test watch
alias ytwv='yarn test:watch --verbose'             # Test watch verbose
alias ytwa='yarn test:watch --watchAll'            # Test watch all
alias ytwav='yarn test:watch --watchAll --verbose' # Test watch all verbose
