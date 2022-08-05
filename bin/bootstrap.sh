#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
# enable for debugging
# set -o xtrace

export DOTFILES_REPO="${DOTFILES_REPO:-$HOME/.dotfiles}"

DOT_FILES=()
while IFS= read -r line; do
  DOT_FILES+=("$line")
done <"${DOTFILES_REPO}/cfg_symlinks"

USER_DIRS=()
while IFS= read -r line; do
  USER_DIRS+=("$line")
done <"${DOTFILES_REPO}/cfg_directories"

# create user dirs in home
create_userdir() {
  for userdir in "${USER_DIRS[@]}"; do
    # shellcheck disable=SC2174
    target_path="${HOME}/${userdir}"
    if ! test -d "${target_path}"; then
      echo "Create ${target_path}"
      mkdir -p "${HOME}/${userdir}"
    fi
    chmod -R 0750 "${HOME}/${userdir}"
  done
}

# loop through DOT_FILES and symlink in home
symlink_dotfile() {
  for dotfile in "${DOT_FILES[@]}"; do
    source_path="${DOTFILES_REPO}/${dotfile}"
    target_path="${HOME}/.${dotfile}"
    # shellcheck disable=SC2046
    mkdir -p $(dirname "${target_path}")
    echo "Symlink $source_path -> $target_path"
    ln -sf "${source_path}" "${target_path}"
  done
}

ln -sf "${DOTFILES_REPO}/config/zsh/.zshenv" "${HOME}/.zshenv"

# setup standard user dirs
echo "Setup userdirs..."
create_userdir
echo ""
echo "Symlink dotfiles..."
symlink_dotfile
echo ""

# install global npm packages into user space .npm-packages
echo "prefix = ${HOME}/.npm-packages" >"${HOME}/.npmrc"

# check/install if xcode cmdline tools are present
if ! xcode-select -p | grep -q CommandLineTools; then
  echo "Install Xcode CommandLineTools"
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  softwareupdate -i -a
  rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
fi
