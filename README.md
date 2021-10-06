# Zukuo's Dotfiles

Here are a collection of my dotfiles, all mainly from linux. Which can be used on a range of systems, I've personally only ever used them for Arch Linux and MacOS.

**The most important dots are:**
- My ZSH config (shell)
- My Neovim config (editor)
- My Alacritty config (terminal)

There may be some required apps in order to use the dots to the full potential, but they should be commented in the actual dots themselves.

## ZSH Setup

In order to setup ZSH you will need to do the following:

```bash
# Install ZSH & plugins (this is different depending on your distro, below is for Arch Linux)
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions fzf fd exa

# Copy dotfiles/.config/zsh to ~/.config/zsh (dotfiles is the location of the git repo)
cp -r dotfiles/.config/zsh ~/.config/zsh

# Copy the dotfiles/.zshenv to ~ (dotfiles is the location of the git repo)
cp dotfiles/.zshenv ~

# Change to ZSH shell
chsh -s $(which zsh)

# Finished!
```

## Neovim Setup
In order to setup Neovim you will need to do the following:

```bash
# Install Neovim 
sudo pacman -S neovim

# Copy dotfiles/.config/nvim to ~/.config/nvim
cp -r dotfiles/.config/nvim ~/.config/nvim

# Create a directory for the Neovim plugins
mkdir ~/.config/nvim/plugged

# Launch Neovim and type the following inside
:PlugInstall 

# Done!
```

## Alacritty Setup
In order to setup Neovim you will need to do the following:

```bash
# Install Alacritty
sudo pacman -S alacritty

# Copy dotfiles/.config/alacritty to ~/.config/alacritty
cp -r dotfiles/.config/alacritty ~/.config/alacritty

# Finished!
```
