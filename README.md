# Zukuo's Dotfiles

Here are a collection of my dotfiles, all mainly from linux. Which can be used on a range of systems, I've personally only ever used them for Arch Linux and MacOS.

**Default Apps:**
- `zsh` - shell
- `neovim` - editor
- `wezterm` - linux terminal
- `iterm2` - mac terminal
- `ranger` - cli file manager
- `yadm` - dotfiles manager

## Installation
The way I install my dotfiles is by using `yadm` - which essentially git clones the entire dotfiles repo into your home directory. This allows for quite easy management and synchronisation between multiple systems.

### 1. Install Dependencies

Install any packages for your respected OS, in order to fully use the dotfiles.

#### Linux
**Main Packages (Arch)**
```bash
sudo pacman -S zsh neovim wezterm ranger neofetch zsh-syntax-highlighting zsh-autosuggestions fzf fd exa xclip yadm yarn nodejs
```

**Extra Packages (Arch)**
```bash
sudo yay -S nerd-fonts-jetbrains-mono nerd-fonts-fira-code ttf-cascadia-code ttf-joypixels ripgrep
```

> You don't need to install of the extra packages, they're more for eye candy

#### MacOS
**Setup Homebrew**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Main Packages**
```bash
brew install neovim exa yadm fzf fd node neofetch
```

### 2. Clone Dotfiles
Using `yadm` we can clone the repo into our home directory.

```bash
yadm clone --depth 1 https://github.com/zukuo/dotfiles.git
```

### 3. Setup Apps
Finally, some of the apps will need some tweaking before they are fully functional.

#### ZSH
**1.** Change Shell
```bash
chsh -s $(which zsh)
```
**2.** Create ZSH History File
```bash
touch $XDG_DATA_HOME/zsh/history
```
**3.** Install Plugins
```bash
mkdir ~/.config/zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins
```

#### Neovim
**1.** Install vim-plug:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

**2.** Install plugins:
```bash
nvim -es -u $MYVIMRC -i NONE -c 'PlugInstall' -c 'qa'
```
> Give this command some time, as it can take a while to install all the plugins

#### Ranger
```bash
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
```
