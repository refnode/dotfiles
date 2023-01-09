### sandbox for experimential zsh configs and functions


# jump to git projects the fzf style
fzf-git-widget() {
  local cmd="find $HOME/src -name .git -type d -maxdepth 6 | sed -e 's/\/\.git//'" setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd -- ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle -N fzf-git-widget
bindkey -M viins ' fg' fzf-git-widget
bindkey -M vicmd ' fg' fzf-git-widget

# get a pod definition the fzf style
fzf-kubectl-get-pods-widget() {
  local selected namespace pod
  local cmd="kubectl get pods -A"
  local selected=( $(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m))
  local ret=$?
  if [ -n "$selected" ]; then
    namespace=$selected[1]
    pod=$selected[2]
    zle push-line # Clear buffer. Auto-restored on next prompt.
    BUFFER="kubectl get pod -n $namespace $pod --output=yaml | nvim -c 'set filetype=yaml' -"
    zle accept-line
  fi
  unset selected namespace pod
  zle reset-prompt
  return $ret
}
zle -N fzf-kubectl-get-pods-widget
bindkey -M vicmd ' kgp' fzf-kubectl-get-pods-widget
bindkey -M viins ' kgp' fzf-kubectl-get-pods-widget
