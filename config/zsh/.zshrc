# refnode's zshrc
# ============================================================
#
# The zsh config uses Prezto for main configuration,
# the zplug mechanism for customizing the zsh with additional
# features and Powerline10k as theme.
#
# The config tries to avoid a bloated config and features not
# managed as zplug packages, so the refnode's settings are
# also introduced as a zplug package.


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The configuration uses the powerline10k theme for the zsh prompt.
# As the powerline10k initialization happens in the zprezto module prompt,
# any config file for that theme must be sourced before initializing prezto.
# To customize the prompt, run `p10k configure` or edit zsh/.p10k.zsh.
if [[ -s "${ZDOTDIR:-$HOME}/.p10k.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.p10k.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
