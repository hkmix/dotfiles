#     _             _               _
#    / \   _ __ ___| |__    _______| |__  _ __ ___
#   / _ \ | '__/ __| '_ \  |_  / __| '_ \| '__/ __|
#  / ___ \| | | (__| | | |  / /\__ \ | | | | | (__
# /_/   \_\_|  \___|_| |_| /___|___/_| |_|_|  \___|

[[ -f ~/.zsh/common.zsh ]] && source ~/.zsh/common.zsh

# Path and editor settings.
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export GOPATH="$HOME/.go"
export PATH="$HOME/.cabal/bin:$HOME/.gem/ruby/2.3.0/bin:$PATH"

export EDITOR=nvim

# Misc appearance settings
export GDK_SCALE=1.75
export QT_QPA_PLATFORMTHEME='qt5ct'

[[ -f ~/.zsh/common_post.zsh ]] && source ~/.zsh/common_post.zsh

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
