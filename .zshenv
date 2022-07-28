# XDG Paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# PATHS
typeset -U PATH path
path=("$HOME/.local/bin/" "/opt/homebrew/bin/" "$HOME/.local/bin/statusbar/" "$XDG_CONFIG_HOME/emacs/bin/" "$path[@]")
export PATH

# Defaults - change accordingly to your prefrences
export VISUAL="nvim"
export EDITOR="nvim"
export DIFFPROG="nvim -d"
export MANPAGER="nvim +Man!"
export TERMINAL="wezterm"
export BROWSER="brave"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --ignore-file '$HOME/.gitignore'"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_COMPLETION_TRIGGER="**"
# export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude \".git\" . $HOME"

# Config
# export MOZ_USE_XINPUT2=1

# Disable files for less
export LESSHISTFILE="-"

# Fixing paths
export ZDOTDIR=$HOME/.config/zsh
export MYVIMRC="$XDG_CONFIG_HOME"/nvim/init.vim
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GOPATH="$XDG_DATA_HOME"/go
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export CARGO_HOME="$XDG_DATA_HOME"/cargo
