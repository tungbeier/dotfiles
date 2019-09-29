#!/bin/sh

xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"

xrdb /home/tung/.Xresources

if [ -x "$HOME/.xprofile" ]; then
    . $HOME/.xprofile
fi

amixer set 'Master' 0

/home/tung/.local/bin/activate-touchpad-tapping.sh

/home/tung/.local/bin/generate-git-aliases.sh

exec i3
