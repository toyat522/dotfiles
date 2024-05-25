#!/bin/sh
pipewire &
ibus-daemon -drx
/usr/bin/emacs --daemon &
