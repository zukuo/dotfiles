# Zukuo's Dotfiles

Here are a collection of my dotfiles, all mainly from linux. Which can be used on a range of systems, I've personally only ever used them for Arch Linux and MacOS.

**Default Apps:**
- `zsh` - shell
- `neovim` - editor
- `wezterm` - main terminal
- `ranger` - file manager
- `alacritty` & `iterm2` - alt terminals

## Installation
There are two ways to install my dotfiles, automatically using the `install.sh` script or manually.

### Automated
**⚠️ This script is not fully functional yet, so be careful using it! ⚠️**

To install my dotfiles, run the following commands to use the install script:
```bash
# Clone Repo
git clone --depth 1 https://github.com/zukuo/dotfiles.git ~/.dotfiles

# Change Directory
cd ~/.dotfiles/installer

# Run Install Script
./install.sh
```

> **Note**: *please read the install script and make a backup of your current configs before running it.*

### Manual

#### Install Dependencies
Use the following commands if you are on Arch Linux (will add one for MacOS in the future):

**Main Packages (Arch)**
```bash
sudo pacman -S zsh neovim wezterm alacritty ranger neofetch zsh-syntax-highlighting zsh-autosuggestions fzf fd exa xclip stow
```

**Extra Packages (Arch)**
```bash
sudo yay -S nerd-fonts-jetbrains-mono nerd-fonts-fira-code ttf-cascadia-code ttf-joypixels ripgrep
```

> You don't need to install of the extra packages, they're more for eye candy

#### Link Files using GNU Stow
```bash
stow ...
```

#### Change Shell to ZSH
```bash
chsh -s $(which zsh)
```

#### Install Neovim Plugins
1. Install vim-plug:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

2. Install plugins:
```bash
nvim -es -u $MYVIMRC -i NONE -c 'PlugInstall' -c 'qa'
```
> Give this command some time, as it can take a while to install all the plugins
