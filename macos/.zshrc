#                        ___  ____            _
#  _ __ ___   __ _  ___ / _ \/ ___|   _______| |__  _ __ ___
# | '_ ` _ \ / _` |/ __| | | \___ \  |_  / __| '_ \| '__/ __|
# | | | | | | (_| | (__| |_| |___) |  / /\__ \ | | | | | (__
# |_| |_| |_|\__,_|\___|\___/|____/  /___|___/_| |_|_|  \___|

[[ -f ~/.zsh/common.zsh ]] && source ~/.zsh/common.zsh

# Path modifiers.
export GOPATH="$HOME/.go"
command -v /usr/libexec/java_home >/dev/null 2>&1 && /usr/libexec/java_home -v 1.8 >/dev/null 2>&1 && export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)" && export PATH="$JAVA_HOME/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="$HOME/Library/Python/3.7/bin:$HOME/.cabal/bin:$HOME/.cargo/bin:$HOME/Applications/cling/bin/actual:$PATH"

# Homebrew.
export PATH="$HOME/.brew/bin:$PATH"
export PATH="$HOME/.brew/opt/llvm/bin:$PATH"
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_ANALYTICS=1
alias brewup="brew update && brew upgrade && brew cask upgrade && brew cleanup"

# MacPorts.
export PATH="/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"
alias portup="sudo port selfupdate && sudo port upgrade outdated"
alias ports="port search --name --regex"

# Other PATH variables.
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Other exports.
export EDITOR=nvim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases.
alias emacsd="emacs --daemon"
alias emacsk="emacsclient -e '(kill-emacs)'"

# Other aliases.
alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -f ~/.zsh/common_post.zsh ]] && source ~/.zsh/common_post.zsh
