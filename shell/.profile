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

# Set GTK themes
export GTK_THEME=Sweet-Dark
export XCURSOR_THEME=Nordzy-cursors
export XCURSOR_SIZE=24

# If DISPLAY is not set and tty1, then run Xserver
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
