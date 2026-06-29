# Set editor
export EDITOR="nvim"

# fcitx for language input
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx

# Add user's private executables
if [[ -d $HOME/bin ]]; then
    export PATH="$HOME/bin:$PATH"
fi
if [[ -d $HOME/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# COMMENT OUT BELOW FOR USING X11
#
# # If DISPLAY is not set and tty1, then set gtk theme and run Xserver
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#     export GTK_THEME=Sweet-Dark
#     export XCURSOR_THEME=Nordzy-cursors
#     export XCURSOR_SIZE=24
#     exec startx
# fi

# If on tty1 and no Wayland session running, start sway
if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    exec sway
fi
