##                                ##
##      Zukuo's ZSH Config  	  ##
##   _____     _                  ##
##  |__  /   _| | ___   _  ___    ##
##    / / | | | |/ / | | |/ _ \   ##
##   / /| |_| |   <| |_| | (_) |  ##
##  /____\__,_|_|\_\\__,_|\___/   ##
##                                ##

### Basic
#########
autoload -U colors && colors
unsetopt correct
unsetopt correctall 
stty -ixon
[[ $- != *i* ]] && return
setopt prompt_subst
setopt autocd
set -o emacs # fix key inputs

### Set Prompt
##############
# source $XDG_CONFIG_HOME/zsh/themes/avahe.zsh
# source $XDG_CONFIG_HOME/zsh/themes/bira.zsh

### Beam Cursor
###############
fix_cursor() {
    echo -ne '\e[5 q'
}
precmd_functions+=(fix_cursor)

### History Config
##################
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$XDG_DATA_HOME/zsh/history

### Colors For Man & Tab
########################
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

### Key Bindings
################
bindkey  "^[[H"   beginning-of-line # home
bindkey  "^[[F"   end-of-line # end
bindkey  "^[[3~"  delete-char # delete
bindkey  "^[[3;5~" kill-word # ctrl+delete

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# For crtl+bkspc
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^H' backward-kill-dir
bindkey '^W' backward-kill-dir

### Source Plugins & Files
##########################

# Load Personal Addons
source $XDG_CONFIG_HOME/zsh/aliases.zsh
source $XDG_CONFIG_HOME/zsh/functions.zsh
source $XDG_CONFIG_HOME/zsh/tab-completion.zsh

# Make sure to install -> zsh-syntax-highlighting (aur), zsh-autosuggestions (aur), zsh-history-substring-search (pacman), fzf (pacman)
source $XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# source /usr/share/fzf/completion.zsh
# source /usr/share/fzf/key-bindings.zsh  # for some neat keybindings for fzf

### Starship Theme
##################
eval "$(starship init zsh)"
