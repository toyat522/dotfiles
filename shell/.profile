# Set editor
export EDITOR="nvim"

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Add user's private executables
if [[ -d $HOME/bin ]]; then
    export PATH="$HOME/bin:$PATH"
fi
if [[ -d $HOME/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# If DISPLAY is not set and tty1, then set gtk theme and run Xserver
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    export GTK_THEME=Sweet-Dark
    export XCURSOR_THEME=Nordzy-cursors
    export XCURSOR_SIZE=24
    exec startx
fi
