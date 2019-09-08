#                                                        _   _
#   _ __ ___     __ _  __   __   ___   _ __       __ _  | | (_)   __ _   ___
#  | '_ ` _ \   / _` | \ \ / /  / _ \ | '_ \     / _` | | | | |  / _` | / __|
#  | | | | | | | (_| |  \ V /  |  __/ | | | |   | (_| | | | | | | (_| | \__ \
#  |_| |_| |_|  \__,_|   \_/    \___| |_| |_|    \__,_| |_| |_|  \__,_| |___/
#-------------------------------------------------------------------------------
alias m='mvn'

alias mc='mvn clean'

alias mi='mvn install'
alias mio='mvn -o install'
alias mif='mvn -T 1C install'
alias miof='mvn -o -T 1C install'
alias miont='mvn -o -Dmaven.test.skip=true install'
alias mint='mvn -Dmaven.test.skip=true install'

alias mifnt='mvn -o -T 1C -Dmaven.test.skip=true install'

