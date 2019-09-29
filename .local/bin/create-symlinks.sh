#!/usr/bin/env bash
#===============================================================================
#
#          FILE: create-symlinks.sh
#
#         USAGE: ./create-symlinks.sh
#
#   DESCRIPTION: Create symlinks to /usr/local/bin
#
#        AUTHOR: tung beier
#       CREATED: 09 September 2019 20:43 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
# Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails

#---  SCRIPT LOGIC  ------------------------------------------------------------
SCRIPTS=(
  i3blocks/i3battery
  i3blocks/i3datetime
  i3blocks/i3disk
  i3blocks/i3network
  i3blocks/i3separator
  i3blocks/i3volume
  idea.sh
)

SCRIPT_PATH="${HOME}/.local/bin"

for SCRIPT in "${SCRIPTS[@]}"; do
  echo "Create symlink for ${SCRIPT}"
  sudo ln -sf "${SCRIPT_PATH}/${SCRIPT}" "/usr/local/bin/${SCRIPT#*/}"
done
