#!/usr/bin/env bash
#===============================================================================
#
#          FILE: sync-system-folders.sh
#
#         USAGE: ./sync-system-folders.sh
#
#   DESCRIPTION: Copy some system folders to a ram disk at start.
#
#  REQUIREMENTS: rsync
#        AUTHOR: tung beier
#       CREATED: 21 August 2019 20:45 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails


#---  SCRIPT LOGIC  ------------------------------------------------------------
idea="$HOME/backup/idea-system"
dest="$HOME/downloads/"

if [ -d ${idea} ]; then
  rsync -aAXPv --delete ${idea} ${dest}
fi

