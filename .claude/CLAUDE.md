# Dotfiles

Dotfiles (e.g. `~/.config/nvim`, `~/.zshrc`) are tracked in a bare git repository at `~/.dotfiles` with `$HOME` as the work tree. The user's alias is `dot`:

```
alias dot='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

- Directories like `~/.config/nvim` have no `.git` of their own; plain `git` fails there.
- Aliases are unavailable in the agent shell, so run the full command: `git --git-dir=$HOME/.dotfiles --work-tree=$HOME <subcommand>`.
- Stage files explicitly by path. Never `add -A` or `add .`, since the work tree is the whole home directory.
