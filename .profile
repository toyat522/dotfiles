# Set editor
export EDITOR="nvim"

# Add emacs binaries
if [[ -d $HOME/.config/emacs/bin ]]; then
    export PATH=$HOME/.config/emacs/bin:$PATH
fi

# Add user's private binaries
if [[ -d $HOME/.local/bin ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Source bash if running bash
if [[ -n "$BASH_VERSION" ]] && [[ -f $HOME/.bashrc ]]; then
    source "$HOME/.bashrc"
fi

# Source zsh if running zsh
if [[ -n $ZSH_VERSION ]] && [[ -f $HOME/.zshrc ]]; then
    source "$HOME/.zshrc"
fi

# If DISPLAY is not set and tty1, then run Xserver
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
