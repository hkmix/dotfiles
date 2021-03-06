bindkey -e
unalias -m "*"

setopt prompt_subst

[ "x$TERM" = "xxterm" ] && export TERM="xterm-256color"

autoload -U compinit promptinit colors zkbd
compinit
promptinit
colors

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export GOPATH="$HOME/.go"
export EDITOR=vim
export TERMINFO=/usr/share/terminfo

export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/.bin:$HOME/.gem/ruby/2.3.0/bin:$PATH"
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env" 
typeset -U PATH

# Misc appearance settings
export FZF_DEFAULT_OPTS='
    --bind ctrl-f:page-down,ctrl-b:page-up
    --color dark,hl:33,hl+:33,fg+:235,bg+:0,fg+:7
    --color info:254,prompt:37,spinner:108,pointer:14,marker:14
'
export QT_STYLE_OVERRIDE='gtk2'
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_EMOJI=1

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select

[[ -f "$HOME/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}" ]] && source $HOME/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

# Fix key bindings
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Infinality
export INFINALITY_FT_AUTOFIT_FORCE_SLIGHT_HINTING=true
export INFINALITY_FT_FILTER_PARAMS="8 25 54 25 8"
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_CONTRAST="0"

# Aliases
alias bc="bc -l"
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias l="ls -a"
alias la="ls -a"
alias ll="ls -la"
alias ls="ls -bh --color=auto"
alias tmux-new="tmux new-session -s"
alias vi="vim"

# Other aliases
alias dog="vimcat"
alias gitcd="cd \$(git rev-parse --show-toplevel)"
alias venvme=". ./venv/bin/activate"
alias buildpath="export PATH=/usr/local/bin:/usr/bin:$PATH"

# Prompt

prompt_char() {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

precmd() {
    venv=""
    size=$(($(tput cols) - 10))
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        venv=" (${VIRTUAL_ENV##*/})"
    fi
    PROMPT=$NEWLINE"%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%})%n %{$fg_bold[blue]%}%$size<...<%~%<<%{$fg_bold[yellow]%}%_$(gitinfo)$venv%{$reset_color%}"$NEWLINE"%{$fg_bold[blue]%}%_$(prompt_char)%{$reset_color%} "
}

NEWLINE=$'\n'

# Functions

ccd() {
    cd /google/src/cloud/zhehong/"$1"
}

mkcd() {
    if [ "$#" -ge 1 ]; then
        mkdir -p "$1" && cd "$1"
    else
        echo "Usage: $0 dir-name"
    fi
}

vimwhich() {
    if [ "$#" -ge 1 ]; then
        vim $(which "$1")
    else
        echo "Usage: $0 executable-name"
    fi
}

[[ -f ~/.platform.sh ]] && source ~/.platform.sh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.dircolors ]] && eval $(dircolors ~/.dircolors)

# Start X
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# Start xbindkeys otherwise
command -v xbindkeys >/dev/null 2>&1 && (pgrep -x 'xbindkeys' >/dev/null 2>&1 || xbindkeys &)
