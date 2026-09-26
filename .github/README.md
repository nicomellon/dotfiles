# dotfiles

A bare git repository whose work tree is `$HOME`. No symlinks: files live where
the programs expect them, and only files that were explicitly added are tracked.

| Path | Used on |
| --- | --- |
| `.config/nvim/` | macOS, Debian |
| `.config/tmux/` | macOS, Debian |
| `.config/ghostty/config` | macOS (inert elsewhere) |
| `.zshrc`, `.zprofile` | macOS (zsh) |
| `.bashrc` | Debian (bash) |
| `.profile` | both |
| `.gitconfig` | both |
| `.claude/settings.json` | both (tmux agent status hooks) |

OS differences are handled at runtime (`[ -x ... ]`, `command -v ...`), not with
branches — files for tools a machine doesn't use are simply ignored there.

## Daily use

```sh
dot status                 # only tracked files are shown
dot add ~/.config/foo      # start tracking something new
dot commit -m "..."
dot push / dot pull
```

`dot` is defined in `.zshrc` / `.bashrc`:

```sh
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

## Setting up a new machine

### Debian

```sh
sudo apt install git tmux fzf bash-completion

# neovim >= 0.12 is required (vim.pack); apt's is too old
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

# starship prompt
curl -sS https://starship.rs/install.sh | sh
```

SSH in from Ghostty: `shell-integration-features = ssh-terminfo` installs the
`xterm-ghostty` terminfo on the server automatically.

### Any machine

```sh
git clone --bare git@github.com:nicomellon/dotfiles.git ~/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dot config status.showUntrackedFiles no

# move pre-existing files (e.g. the default .bashrc/.profile) out of the way
mkdir -p ~/.dotfiles-backup
dot ls-tree -r --name-only HEAD | while read -r f; do
	if [ -e "$HOME/$f" ]; then
		mkdir -p "$HOME/.dotfiles-backup/$(dirname "$f")"
		mv "$HOME/$f" "$HOME/.dotfiles-backup/$f"
	fi
done

dot checkout
```

Open a new shell, then start `nvim` once to install plugins.
