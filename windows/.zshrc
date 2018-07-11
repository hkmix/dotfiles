bindkey -e
unalias -a

export TERM=xterm-256color

autoload -U compinit promptinit colors zkbd
compinit
promptinit
colors

export GOPATH="$HOME/.go"
command -v /usr/libexec/java_home >/dev/null 2>&1 && /usr/libexec/java_home -v 1.8 >/dev/null 2>&1 && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH="/usr/local/sbin:/usr/local/bin:$HOME/.cabal/bin:$HOME/.local/bin:$HOME/.bin:$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="/mingw64/bin:$PATH"
export EDITOR=vim

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

# Aliases
alias bc="bc -l"
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias l="ls -a"
alias la="ls -a"
alias ll="ls -la"
alias ls="ls -bh --color=auto"
alias tmux-new="tmux -2 new-session -s"
alias vi="vim"

# Other aliases
alias dog="vimcat"
alias gitcd="cd \$(git rev-parse --show-toplevel)"
alias venvme=". ./venv/bin/activate"

# Prompt

NEWLINE=$'\n'

precmd() {
    PROMPT=$NEWLINE"%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n) %{$fg_bold[blue]%}%~%{$fg_bold[yellow]%}$venv%{$reset_color%}"$NEWLINE"%{$fg_bold[blue]%}$%{$reset_color%} "
}

# Functions

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

[[ -f ~/.platform.sh ]] && source ~/.platform.sh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.dircolors ]] && eval $(dircolors --sh ~/.dircolors)
