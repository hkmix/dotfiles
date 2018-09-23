#          _                    _                        _
#  _______| |__  _ __ ___   ___| |__   __ _ _ __ ___  __| |
# |_  / __| '_ \| '__/ __| / __| '_ \ / _` | '__/ _ \/ _` |
#  / /\__ \ | | | | | (__  \__ \ | | | (_| | | |  __/ (_| |
# /___|___/_| |_|_|  \___| |___/_| |_|\__,_|_|  \___|\__,_|

bindkey -e
unalias -a

autoload -U compinit bashcompinit promptinit colors zkbd
compinit
bashcompinit
promptinit
colors

export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$HOME/.bin:$PATH"

# zsh settings.
[[ -f "$HOME/.bash_completion" ]] && source $HOME/.bash_completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select

setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt interactivecomments

# zkbd key bindings.
[[ -f "$HOME/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}" ]] && source $HOME/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

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

# FZF settings.
export FZF_DEFAULT_OPTS='
    --bind ctrl-f:page-down,ctrl-b:page-up
    --color dark,hl:33,hl+:33,fg+:235,bg+:0,fg+:7
    --color info:254,prompt:37,spinner:108,pointer:14,marker:14
'
export FZF_DEFAULT_COMMAND='rg --files'

# Other settings.
export EDITOR=vim
export WORDCHARS='_'

# Aliases.
alias bc="bc -l"
alias df="df -h"
alias dog="vimcat"
alias dotcd="cd ~/.dotfiles && git fetch"
alias du="du -h"
alias dus="du -d1h | sort -h"
alias gitcd="cd \"\$(git rev-parse --show-toplevel)\""
alias grep="grep --color=auto"
alias l="ls -a"
alias la="ls -a"
alias ll="ls -la"
alias ls="ls -bh --color=auto"
alias tmux-new="tmux -2 new-session -s"
alias venvme=". ./venv/bin/activate"
alias vi="nvim"
alias vim="nvim"

# Emacs aliases.
alias emacsd="emacs --daemon"
alias emacsk='emacsclient --eval "(kill-emacs)"'
alias emacsr="emacsk && emacsd"
alias emacsc="emacsclient -c"
alias eee="emacsclient -c"

# Functions.
ccd() {
    cd ~/Projects/"$1"
}

mkcd() {
    if [ $# -ge 1 ]; then
        mkdir -p "$1" && cd "$1"
    else
        echo "Usage: $0 dir-name"
    fi
}

# Prompt.
prompt_char() {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

NEWLINE=$'\n'

precmd() {
    venv=""
    if [[ "$VIRTUAL_ENV" != "" ]]; then
        venv=" (${VIRTUAL_ENV##*/})"
    fi
    PROMPT=$NEWLINE"%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n) %{$fg_bold[blue]%}%~%{$fg_bold[yellow]%}%_$(gitinfo)$venv%{$reset_color%}"$NEWLINE"%{$fg_bold[blue]%}%_$(prompt_char)%{$reset_color%} "
}
