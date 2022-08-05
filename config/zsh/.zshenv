#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sven Wilhelm <refnode@gmail.com>
#
# Based on the zprezto files
#

# Define DOTFILES location for scripts and configs
export DOTFILES="${HOME}/.dotfiles"

# Define ZDOTDIR to keep the majority of zsh config out of users home root
export ZDOTDIR="${DOTFILES}/config/zsh"

# If present source a workspace local zshenv file.
if [ -s "${HOME}/.zshenv.local" ]; then
    source "${HOME}/.zshenv.local"
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
