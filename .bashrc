#      _               _
#     | |__   __ _ ___| |__  _ __ ___
#     | '_ \ / _` / __| '_ \| '__/ __|
#     | |_) | (_| \__ \ | | | | | (__
#     |_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi='vim'
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iv'
alias ls='ls --color=auto'

PS1='\[\e[32m\]\u\[\e[37m\] at \[\e[36m\]\H \[\e[37m\]in \[\e[33m\]\w \[\e[31m\]#\[\e[0m\] '
