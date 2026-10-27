# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/nico.mellon/.docker/bin"
# End of Docker Desktop section.

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# bash login shells (e.g. ssh) don't read .bashrc on their own
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi
