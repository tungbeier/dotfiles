#!/bin/sh

xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"

xrdb /home/tung/.Xresources

if [ -x "$HOME/.xprofile" ]; then
    . $HOME/.xprofile
fi

amixer set 'Master' 0
activate-touchpad-tapping
sync-system-folders

exec i3
