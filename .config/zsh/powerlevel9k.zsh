#!/usr/bin/env zsh
#    ____                        _                   _  ___  _  __
#   |  _ \ _____      _____ _ __| |    _____   _____| |/ _ \| |/ /
#   | |_) / _ \ \ /\ / / _ \ '__| |   / _ \ \ / / _ \ | (_) | ' /
#   |  __/ (_) \ V  V /  __/ |  | |__|  __/\ V /  __/ |\__, | . \ 
#   |_|   \___/ \_/\_/ \___|_|  |_____\___| \_/ \___|_|  /_/|_|\_\
#
ZSH_THEME="powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=true
POWERLEVEL9K_STATUS_HIDE_SIGNAME=false
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

# powerlevel9k colors POWERLEVEL9K_<name-of-segment>_<state>_[BACKGROUND|FOREGROUND]
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='green'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='red'
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_BACKGROUND='black'
#POWERLEVEL9K_DATE_BACKGROUND='blue'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time background_jobs dir_writable dir vcs status newline vi_mode root_indicator)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time vi_mode background_jobs dir_writable dir vcs status newline)
POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ssh date battery)
