#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
# enable for debugging
# set -o xtrace

# check/install if xcode cmdline tools are present
if ! xcode-select -p | grep -q CommandLineTools; then
  echo "Install Xcode CommandLineTools"
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  softwareupdate -i -a
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi

export DOTFILES_REPO="${DOTFILES_REPO:-$HOME/.dotfiles}"
