#!/bin/sh
setxkbmap -option caps:escape &

xss-lock slock &
xautolock -time 15 -locker slock -detectsleep &
pipewire &

ibus-daemon -drx
/usr/bin/emacs --daemon &

feh --bg-fill ~/.config/bg/aurora.jpg &
