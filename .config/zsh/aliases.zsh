##                                ##
##      Zukuo's ZSH Aliases  	  ##
##   _____     _                  ##
##  |__  /   _| | ___   _  ___    ##
##    / / | | | |/ / | | |/ _ \   ##
##   / /| |_| |   <| |_| | (_) |  ##
##  /____\__,_|_|\_\\__,_|\___/   ##
##                                ##

# Changing Directories
alias ..="cd .."
alias cd..="cd .."
alias cd...="cd ../.."

alias -g ...="../.."
alias -g ....="../../.."

alias dots="cd $HOME/Git/dotfiles"

# Git
alias gs="git status"
alias ga="git add"
alias gall="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gt="git tag"
alias gb="git branch"
alias gco="git checkout"
alias gm="git merge"
alias gr="git rebase"

# Yadm
alias ys="yadm status"
alias ya="yadm add"
alias yall="yadm add -u"
alias yc="yadm commit"
alias ycm="yadm commit -m"
alias yp="yadm push"

# Vim
alias vpc="nvim +PlugClean"
# alias vpi="nvim +PlugInstall"
alias vpi="nvim -es -u $MYVIMRC -i NONE -c 'PlugInstall' -c 'qa'"

# Editing
alias v="nvim"
alias vim="nvim"
alias sv="sudo nvim"

alias eV="nvim $XDG_CONFIG_HOME/nvim/init.vim"
alias eZ="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias eA="nvim $XDG_CONFIG_HOME/zsh/aliases.zsh"
alias Z="source $XDG_CONFIG_HOME/zsh/.zshrc"

# Listing
# alias ls="ls -hN --color=auto --group-directories-first"
# alias l="ls -vla"
# alias l="ls -lah --color=auto --group-directories-first"
alias ls="exa --color=always --group-directories-first --icons" # all files and dirs in long format
alias l="exa -al --color=always --group-directories-first --icons"
alias la="exa -a --color=always --group-directories-first --icons"

alias grep="grep --color=auto"
alias diff="diff --color=auto"

# Extra
alias py="python3"
alias pacman="sudo pacman"
alias wifi="nmtui"
# alias bbash="/opt/homebrew/bin/bash"

# Fixing XDG Locations For Programs
alias wget="wget --hsts-file $XDG_DATA_HOME/wget/wget-hsts"
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias xbindkeys="xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
