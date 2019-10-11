#     _             _               _
#    / \   _ __ ___| |__    _______| |__  _ __ ___
#   / _ \ | '__/ __| '_ \  |_  / __| '_ \| '__/ __|
#  / ___ \| | | (__| | | |  / /\__ \ | | | | | (__
# /_/   \_\_|  \___|_| |_| /___|___/_| |_|_|  \___|

[[ -f ~/.zsh/common.zsh ]] && source ~/.zsh/common.zsh

# Path and editor settings.
export GOPATH="$HOME/.go"
export EDITOR=vim

# Misc appearance settings.
export GDK_DPI_SCALE=1.125
export QT_QPA_PLATFORMTHEME='qt5ct'

[[ -f ~/.zsh/common_post.zsh ]] && source ~/.zsh/common_post.zsh

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 && -z $TMUX ]] && exec startx
