bindkey -e
unalias -a

autoload -U compinit promptinit colors zkbd
compinit
promptinit
colors

# For OS X to get default bindings
export PATH="/usr/local/Cellar:/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:/Applications/Eclipse.app/Contents/Eclipse:$HOME/.local/bin:$HOME/.bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export GOPATH="$HOME/.go"
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_GITHUB_API_TOKEN="d47ecf83d89e7d4e7fe141f1634a26a2daffed6a"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' menu select

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

# OS X-specific settings
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases
alias vi="nvim"
alias vim="nvim"
alias ls="ls -bh --color=auto"
alias grep="grep --color=auto"
alias la="ls -a"
alias ll="ls -la"
alias df="df -h"
alias du="du -h"
alias bc="bc -l"
alias tmux-new="tmux -2 new-session -s"

# Other aliases
alias gitcd="cd $(git rev-parse --show-toplevel)"

# OS X-specific aliases
alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

# Classes
# none

prompt_char() {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}
precmd() {
    PROMPT=$NEWLINE"%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n) %{$fg_bold[blue]%}%~%{$fg_bold[yellow]%}%_$(gitinfo)%{$reset_color%}"$NEWLINE"%{$fg_bold[blue]%}%_$(prompt_char)%{$reset_color%} "
}

NEWLINE=$'\n'

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.primate_aliases.zsh ]] && . ~/.primate_aliases.zsh
