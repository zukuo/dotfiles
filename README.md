<h1 align="center">~/.*</h1>

<div align="center">
    <a href="#showcase">Showcase</a><span> • </span>
    <a href="#installation">Installation</a><span> • </span>
    <a href="#final-touches">Final Touches</a>
    <p></p>
</div> 

Here are a collection of my dotfiles, all mainly from linux. Which can be used on a range of systems, I've personally only ever used them for Arch Linux and MacOS.

**Main Applications:**
- [`zsh`](https://www.zsh.org/) - shell
- [`neovim`](https://neovim.io/) - editor
- [`wezterm`](https://wezfurlong.org/wezterm/index.html) - terminal
- [`yadm`](https://yadm.io/) - dotfiles manager

## Showcase
<div align="center">
    <img width="1680" alt="desktop" src="https://github.com/zukuo/dotfiles/assets/67321042/091041e4-61f0-4986-9a9b-fcb9ec4a6497">
</div>

## Installation
The way I install my dotfiles is by using `yadm` - which essentially git clones the entire dotfiles repo into your home directory. Allowing for super easy management and synchronisation between multiple systems.

### 1. Install Dependencies

Install any packages for your respected OS, in order to fully use the dotfiles.

<details>
<summary><b>Arch Linux</b></summary>

######

```bash
sudo yay -S zsh neovim wezterm ranger neofetch zsh-syntax-highlighting zsh-autosuggestions fzf fd exa xclip yadm yarn nodejs ttf-cascadia-code ttf-joypixels ttf-jetbrains-mono ripgrep
```

> You don't need to install all of the extra packages, they're more for eye candy (eg. fonts)
       
</details>

<details>
<summary><b>MacOS</b></summary>

##### 1. Setup Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
##### 2. Install Packages
```bash
brew install neovim exa yadm fzf fd node neofetch
```
```bash
brew install --cask wezterm raycast
```

</details>

### 2. Clone Dotfiles
Using `yadm` we can clone the repo into our home directory.

```bash
yadm clone --depth 1 https://github.com/zukuo/dotfiles.git
```

## Final Touches
Finally, some of the apps will need some tweaking before they are fully functional.

<details>
<summary><b>ZSH</b></summary>

##### 1. Change Shell
```bash
chsh -s $(which zsh)
```
##### 2. Create ZSH History File
```bash
touch $XDG_DATA_HOME/zsh/history
```
##### 3. Install Plugins
```bash
mkdir ~/.config/zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins
```

</details>
