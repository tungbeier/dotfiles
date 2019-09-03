#              _
#      _______| |__  _ __ ___
#     |_  / __| '_ \| '__/ __|
#      / /\__ \ | | | | | (__
#     /___|___/_| |_|_|  \___|
#
DEFAULT_USER=`whoami` # Add default user to hide user@host in prompt

CLASSPATH=".:.*:/usr/share/java/*"
GOPATH=$HOME/go
GOBIN=$GOPATH/bin
M2_HOME=/opt/maven
PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.config/scripts:$M2_HOME/bin:$GOBIN
export GOBIN
export GOPATH
export M2_HOME
export PATH
export CLASSPATH

export TERM="xterm-256color" # 256 color schemes support

export BAT_THEME="DarkNeon"

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root line)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=15"

RANGER_LOAD_DEFAULT_RC=FALSE

export RAM_DISK_PATH="$HOME/downloads"
export BACK_UP_PATH="$HOME/backup"

HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history

plugins=(gitfast git-extras golang wd zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Setopt
setopt no_beep # Do not beep on error
setopt auto_cd # Go to directory without cd
setopt pushd_ignore_dups # Do not push multiple copies of the same directory onto the directory stack

# Allow multiple terminal session to all append to one command history
setopt append_history
# When trimming history, lose oldest duplicates first
setopt hist_expire_dups_first
# Ignore duplicates for command history
setopt hist_ignore_dups
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate
# Ignore commands, which start with space, for command history
setopt hist_ignore_space
setopt hist_save_no_dups # Do not write duplicate entries in the history file
setopt share_history

# Only show completion menu, do not select the first entry
setopt auto_menu
unsetopt menu_complete

if [ -d $HOME/.config/alias ]; then
    for file in $HOME/.config/alias/*
    do
        source ${file}
    done
fi

if [ -f $HOME/.config/proxy ]; then
    source $HOME/.config/proxy
fi

if [ -f $HOME/.config/zsh_autocomplete ]; then
    source $HOME/.config/zsh_autocomplete
fi

# Activate vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^ ' autosuggest-accept
export KEYTIMEOUT=1

eval `dircolors $HOME/.dir_colors`

neofetch

autoload -U promptinit; promptinit
prompt pure

