
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# bash login shells (e.g. ssh) don't read .bashrc on their own
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi
