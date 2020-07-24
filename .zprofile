#                           __ _ _
#      _____ __  _ __ ___  / _(_) | ___
#     |_  / '_ \| '__/ _ \| |_| | |/ _ \
#      / /| |_) | | | (_) |  _| | |  __/
#     /___| .__/|_|  \___/|_| |_|_|\___|
#         |_|
#-------------------------------------------------------------------------------

M2_HOME=/opt/maven
GOPATH=$HOME/go
GOBIN=$GOPATH/bin
PATH=$PATH:$M2_HOME/bin:$GOBIN
export GOBIN
export GOPATH
export M2_HOME
export PATH

# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(find "$HOME/.local/bin" -type d | tr '\n' ':' | sed 's/:$//')"

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERMINAL="st"
export BROWSER="chromium"
export READER="mupdf"
export FILE="vifm"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C

# Start graphical server
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

