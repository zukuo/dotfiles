#!/bin/zsh

# Autostart X using startx after tty login.

# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
# 	exec startx
# fi

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XDG_CONFIG_HOME/X11/xinitrc" -- :0

# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx -- vt1 &> /dev/null
