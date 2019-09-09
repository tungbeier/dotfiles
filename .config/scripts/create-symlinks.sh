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
  i3battery
  i3datetime
  i3disk
  i3network
  i3separator
  i3volume
  idea.sh
)

SCRIPT_PATH="${HOME}/.config/scripts"

for SCRIPT in "${SCRIPTS[@]}"; do
  echo "Create symlink for ${SCRIPT}"
  sudo ln -sf "${SCRIPT_PATH}/${SCRIPT}" "/usr/local/bin/${SCRIPT}"
done
