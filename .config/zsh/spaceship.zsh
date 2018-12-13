#!/usr/bin/env zsh
#    ____                            _     _
#   / ___| _ __   __ _  ___ ___  ___| |__ (_)_ __
#   \___ \| '_ \ / _` |/ __/ _ \/ __| '_ \| | '_ \ 
#    ___) | |_) | (_| | (_|  __/\__ \ | | | | |_) |
#   |____/| .__/ \__,_|\___\___||___/_| |_|_| .__/
#         |_|                               |_|
#    ____                            _
#   |  _ \ _ __ ___  _ __ ___  _ __ | |_
#   | |_) | '__/ _ \| '_ ` _ \| '_ \| __|
#   |  __/| | | (_) | | | | | | |_) | |_
#   |_|   |_|  \___/|_| |_| |_| .__/ \__|
#                             |_|
# See https://github.com/denysdovhan/spaceship-prompt
#
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX=' '
SPACESHIP_CHAR_SYMBOL='➤'
SPACESHIP_CHAR_PREFIX=' '
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_DIR_PREFIX=' '
SPACESHIP_GIT_PREFIX=' '
SPACESHIP_DOCKER_PREFIX=' '
SPACESHIP_EXEC_TIME_PREFIX=' '

SPACESHIP_PROMPT_ORDER=(
    dir git docker exec_time exit_code line_sep char
)

# 
# 
