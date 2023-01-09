#
# refnode's personal aliases and functions
#
# Authors:
#   Sven Wilhelm <refnode@gmail.com>
#

# Load dependencies
pmodload 'helper'

# source fzf keybindings
source "$(brew --prefix fzf)/shell/key-bindings.zsh"

# initialize goenv
eval "$(goenv init -)"

bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins ' fh' fzf-history-widget
bindkey -M vicmd ' fh' fzf-history-widget
bindkey -M viins ' fd' fzf-cd-widget

# all vi/vim calls to neovim
alias vi='nvim'
alias vim='nvim'

# modern replacements for essential cli tools
alias cat='bat'
alias ls='exa'
alias ll='exa --long --group --git'
alias lla='exa --long --group --git --all'

# shorties
alias pm='podman'
alias k='kubectl'
alias g='git'
alias tg='topgrade'
alias cz='chezmoi'
alias czd='chezmoi cd'

# linux compatibility
alias ldd='otool -L'

alias dotenv="${EDITOR} .env"
alias ref-pathlist="printenv PATH | sed -e 's/:/\n/g'"
alias .f="cd ${DOTFILES}"
alias zshreload="source ${HOME}/.zshenv && source ${ZDOTDIR}/.zprofile && source ${ZDOTDIR}/.zshrc"

# source my sandbox to include experimental configs and functions
source "${0:h}/sandbox.zsh"
