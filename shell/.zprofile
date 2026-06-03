# Set editor
export EDITOR="nvim"

# Add emacs binaries
if [[ -d $HOME/.config/emacs/bin ]]; then
    export PATH=$HOME/.config/emacs/bin:$PATH
fi

# Add user's private executables
if [[ -d $HOME/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# If on tty1 and no Wayland session running, start sway
if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
    export XDG_CURRENT_DESKTOP=sway
    export XDG_SESSION_TYPE=wayland
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    exec sway
fi
