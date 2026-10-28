[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# User-local binaries
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac

alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

eval "$(starship init zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/nico.mellon/.docker/completions $fpath)
# End of Docker CLI completions

# Completion
fpath=(/opt/homebrew/share/zsh-completions $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS

# Plugins (syntax-highlighting must stay last)
source <(fzf --zsh)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opencode
export PATH=/Users/nico.mellon/.opencode/bin:$PATH
