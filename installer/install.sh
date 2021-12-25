#!/usr/bin/env bash

# Zukuo's Dots Installer!
# - A little script to install all of my dotfiles

# Define Formatting
BOLD=$'\e[1m'

RED=$'\e[0;31m'
GREEN=$'\e[0;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
PURPLE=$'\e[0;35m'
CYAN=$'\e[0;36m'

BRED=$'\e[1;31m'
BGREEN=$'\e[1;32m'
BYELLOW=$'\e[1;33m'
BBLUE=$'\e[1;34m'
BPURPLE=$'\e[1;35m'
BCYAN=$'\e[1;36m'

NC=$'\e[0m' # No Color

# Install Script Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Welcome Message
# ---------------
welcome() {
clear
printf "
  +------------------------------------+    
  | Welcome to Zukuo's Dots Installer! |    
  +------------------------------------+    

           ███████╗██████╗ ██╗
           ╚══███╔╝██╔══██╗██║
             ███╔╝ ██║  ██║██║
            ███╔╝  ██║  ██║██║
           ███████╗██████╔╝██║
           ╚══════╝╚═════╝ ╚═╝
"; }

welcome | ./dotacat -S 110

read -p "${BRED}Are you ready to install the dotfiles? (y/n)${NC} " -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit
fi

# Check if host is on Arch
# ------------------------
echo
read -p "${BBLUE}Are you on an Arch Linux machine? (y/n)${NC} " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    printf "${BGREEN}Installing Dependencies...${NC}\n"
    sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions fzf fd ripgrep exa xclip neovim alacritty
else
    printf "\n${BOLD}Continuing with installation...${NC}\n\n"
fi

arrow() { printf "${BGREEN}==>${NC} ${BOLD}" "$1"; }
colons() { printf "${BBLUE}::${NC} ${BOLD}" "$1"; }

# # Clone Dots
# # ----------
# arrow && printf "Cloning dotfiles...\n"
# # git clone --depth 1 https://github.com/zukuo/dotfiles ~/.dotfiles

# Link Dots
# ---------
arrow && printf "Linking files...${NC}\n"

# ln -s $SCRIPT_DIR/.config/alacritty $XDG_CONFIG_HOME/alacritty
# ln -s $SCRIPT_DIR/.zshenv $HOME/.zshenv

colons && printf "${BGREEN}Linked dotfiles to your home!${NC}\n" && echo

# Change Shell
# ------------
arrow && printf "Changing shell...${NC}\n"

# chsh -s $(which zsh)

colons && printf "${BGREEN}Changed your shell to ZSH!${NC}\n" && echo

# Setup Neovim
# ------------
arrow && printf "Setting up neovim...${NC}\n"
