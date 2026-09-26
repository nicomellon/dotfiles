[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

eval "$(starship init zsh)"
