#              _
#      _______| |__  _ __ ___
#     |_  / __| '_ \| '__/ __|
#      / /\__ \ | | | | | (__
#     /___|___/_| |_|_|  \___|
#-------------------------------------------------------------------------------

# Add default user to hide user@host in prompt
DEFAULT_USER=`whoami`

CLASSPATH=".:.*:/usr/share/java/*"
M2_HOME=/opt/maven
GOPATH=$HOME/go
GOBIN=$GOPATH/bin
PATH=$PATH:$M2_HOME/bin:$GOBIN
export GOBIN
export GOPATH
export M2_HOME
export PATH
export CLASSPATH

export TERM="xterm-256color"

export BAT_THEME="DarkNeon"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root line)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=15"

export RAM_DISK_PATH="$HOME/downloads"
export BACK_UP_PATH="$HOME/backup"

HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"
HISTFILE="$HOME/.config/zsh/history"

plugins=(gitfast git-extras golang wd zsh-completions zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_COLLATE=C

export SSH_KEY_PATH="~/.ssh/rsa_id"

# Setopt - see zsh.sourceforge.net/Doc/Release/Options.html
setopt no_beep
setopt auto_cd
setopt pushd_ignore_dups

# Allow multiple terminal session to all append to one command history
setopt append_history
setopt bang_hist
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups

setopt inc_append_history
setopt share_history

# Only show completion menu, do not select the first entry
setopt auto_menu
unsetopt menu_complete

local ALIAS=$HOME/.config/alias
if [ -d ${ALIAS} ]; then
    for f in ${ALIAS}/*; do
        source ${f}
    done
fi

if [ -f $HOME/.config/proxy ]; then
    source $HOME/.config/proxy
fi

if [ -f $HOME/.config/zsh_autocomplete ]; then
    source $HOME/.config/zsh_autocomplete
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tung/.local/share/google-cloud-sdk/path.zsh.inc' ]; then
    . '/home/tung/.local/share/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tung/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then
    . '/home/tung/.local/share/google-cloud-sdk/completion.zsh.inc';
fi

bindkey -v # vi key binding
export KEYTIMEOUT=1 # minimize delay

bindkey '^R' history-incremental-search-backward
bindkey '^ ' autosuggest-accept

eval `dircolors $HOME/.dir_colors`

neofetch

autoload -U compinit && compinit

# Pure prompt - see https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

