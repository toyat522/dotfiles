# dotfiles

Install dependencies and recommended tools (on a debian system):

```
sudo apt update && sudo apt upgrade
sudo apt install bat fd-find ranger ripgrep sxiv zathura zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo snap install alacritty --classic
```

Run the following commands to create the symlinks:

```
stow -t ~ */
```

Change the default shell to `zsh`:

```
chsh -s $(which zsh)
```
