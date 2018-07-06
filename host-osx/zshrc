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
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/Cellar:$HOME/Library/Python/3.7/bin:/usr/local/bin/tex:/usr/local/opt/coreutils/libexec/gnubin:$HOME/.cabal/bin:$HOME/.cargo/bin:$HOME/Applications/cling/bin/actual:$PATH"
export PKG_CONFIG_PATH=/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# Other exports.
export HOMEBREW_NO_EMOJI=1
export EDITOR=nvim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliases.
alias emacsd="emacs --daemon"
alias emacsk="emacsclient -e '(kill-emacs)'"

# RCM aliases.
alias lsrcl="lsrc -B osx -v"
alias mkrcl="mkrc -B osx -v"
alias rcupl="rcup -B osx -v"

# Other aliases.
alias venvme=". ./venv/bin/activate"
alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"
alias brewup="brew update && brew upgrade && brew cleanup"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[[ -f ~/.zsh/common_post.zsh ]] && source ~/.zsh/common_post.zsh
