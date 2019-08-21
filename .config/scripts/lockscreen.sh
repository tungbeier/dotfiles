#!/usr/bin/env bash
#===============================================================================
#
#          FILE: lockscreen.sh
#
#         USAGE: ./lockscreen.sh
#
#   DESCRIPTION: Used by i3 to lock the workspace.
#
#  REQUIREMENTS: i3lock-color(AUR)
#                scrot
#                imagemagick
#        AUTHOR: tung beier
#       CREATED: 21 August 2019 20:29 CEST
#===============================================================================

set -o errexit  # Exit when a command fails
                # Use || true if a command is allowed to fail
set -o nounset  # Treat unset variables as an error
set -o pipefail # Exit when a command in a pipeline fails


#---  SCRIPT LOGIC  ------------------------------------------------------------
image='/tmp/screen.png'

# take the screenshot
scrot --quality 25 --silent "$image"
# blur the image
convert "$image" -blur 0x4 "$image"

blank='#00000000'     # blank
clear_ish='#ffffff22' # clear ish
default='#eee8d5ff'   # default
text='#002b36ff'      # text
wrong='#dc322fff'     # wrong
verifying='#b58900ff' # verifying

i3lock --image "$image" \
  --tiling \
  --ignore-empty-password \
  --show-failed-attempts \
  --insidevercolor=$clear_ish \
  --ringvercolor=$verifying \
  \
  --insidewrongcolor=$clear_ish \
  --ringwrongcolor=$wrong \
  \
  --insidecolor=$blank \
  --ringcolor=$default \
  --linecolor=$blank \
  --separatorcolor=$default \
  \
  --verifcolor=$text \
  --wrongcolor=$text \
  --layoutcolor=$text \
  --keyhlcolor=$wrong \
  --bshlcolor=$wrong \
  \
  --radius=65 \
  --ring-width=30 \
  --veriftext="" \
  --wrongtext="" \
  --noinputtext="" \

  rm "$image"

