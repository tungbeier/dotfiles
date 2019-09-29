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
set -o pipefail # Exit when a command in a pipeline fails


#---  SCRIPT LOGIC  ------------------------------------------------------------
IDEA_PATH="$BACK_UP_PATH/idea-system"

if [[ -d "$IDEA_PATH" ]] && [[ ! -d "${RAM_DISK_PATH}/idea-system" ]]; then
  rsync -aAXPv --delete $IDEA_PATH "${RAM_DISK_PATH}/"
fi

sh /opt/idea-IU/bin/idea.sh
