# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set zinit and plugin directories
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source fzf if .fzf.zsh exists (for ubuntu not having latest version)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Competion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Add PlatformIO to PATH if found
[ -d ~/.platformio ] && export PATH=$PATH:~/.platformio/penv/bin

# Enable vim keybindings
bindkey -v

# Aliases
alias ls="eza --color=always"
alias vim="nvim"
alias bat="bat -p"
alias cat="bat -p"
alias grep="rg"

# Source ROS2 function (e.g. sr2 humble)
sr2() {
    if [[ "$1" == "vrx" ]]; then
        export ROS_DISTRO="jazzy"
        source /opt/ros/$ROS_DISTRO/setup.zsh
        source $HOME/dev/vrx_ros2/dev_ws/install/setup.zsh
        source $HOME/dev/vrx_ros2/vrx_ws/install/setup.zsh
        source /usr/share/colcon_cd/function/colcon_cd.sh
        export _colcon_cd_root=/opt/ros/$ROS_DISTRO/
        eval "$(register-python-argcomplete ros2)"
        eval "$(register-python-argcomplete colcon)"
        return
    fi

    source /opt/ros/$1/setup.zsh
    source /usr/share/colcon_cd/function/colcon_cd.sh
    export _colcon_cd_root=/opt/ros/$1/
    eval "$(register-python-argcomplete ros2)"
    eval "$(register-python-argcomplete colcon)"
}

# Connect to display (e.g. connect HDMI-1)
connect() {
    xrandr --output $1 --auto --right-of eDP-1
}

# Disconnect from display (e.g. disconnect HDMI-1)
disconnect() {
    xrandr --output $1 --off
}
