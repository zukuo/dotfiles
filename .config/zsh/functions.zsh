##                                ##
##      Zukuo's ZSH Functions  	  ##
##   _____     _                  ##
##  |__  /   _| | ___   _  ___    ##
##    / / | | | |/ / | | |/ _ \   ##
##   / /| |_| |   <| |_| | (_) |  ##
##  /____\__,_|_|\_\\__,_|\___/   ##
##                                ##

# Fuzzy Find Files
se() { local file; file=$(fd . $HOME/.local/bin/ --type f --type symlink --follow | fzf) && $EDITOR $file; unset file ; }
cce() { local file; file=$(fd . $XDG_CONFIG_HOME/ --type f --type symlink --follow -H -d 2 | fzf) && $EDITOR $file; unset file ; }
ce() { local file; file=$(yadm list -a | sed "s|^|$HOME\/|" | fzf) && $EDITOR $file; unset file ; }
cf() { local dir; dir=$(yadm ls-tree -d -r main --name-only --full-tree | sed "s|^|$HOME\/|" | fzf) && cd $dir; unset dir ; }
vp() { local dir; dir=$(git rev-parse --show-toplevel 2>/dev/null | sed "s;$HOME;~;" || pwd | sed "s;$HOME;~;") && $EDITOR "+NeovimProjectLoad ${dir}"; unset dir; }

vf() { local file; file=$(fd . --type f | fzf) && $EDITOR - $file; unset file; zle reset-prompt ; }
gf() { local dir; dir=$(fd . $HOME/Git --type d -d 1 | fzf) && cd $dir; unset dir; zle reset-prompt ; }

# Bind Keys for Fuzzy
zle -N gf
bindkey "^g" gf
zle -N vf
bindkey "^p" vf

# Get IP Address
my_ip() { curl ifconfig.co }

# Extract Files
function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ] ; then
      # NAME=${1%.*}
      # mkdir $NAME && cd $NAME
      case $1 in
        *.tar.bz2)   tar xvjf ../$1    ;;
        *.tar.gz)    tar xvzf ../$1    ;;
        *.tar.xz)    tar xvJf ../$1    ;;
        *.tar)       tar xvf ../$1     ;;
        *.tbz2)      tar xvjf ../$1    ;;
        *.tgz)       tar xvzf ../$1    ;;
        *.zip)       unzip ../$1       ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

# Creates an archive (*.tar.gz) from given directory
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
