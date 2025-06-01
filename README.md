# dotfiles

Install dependencies and recommended tools (on a debian system):

```
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update && sudo apt upgrade
sudo apt install \
    bat \
    fd-find \
    ranger \
    ripgrep \
    neovim \
    software-properties-common \
    sxiv \
    xclip \
    zathura \
    zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo snap install alacritty --classic
```

If on `i3`, additionally run

```
sudo apt install feh i3 polybar python3-i3ipc rofi
```

Run the following commands to create the symlinks:

```
stow -t ~ */
```

Change the default shell to `zsh`:

```
chsh -s $(which zsh)
```
