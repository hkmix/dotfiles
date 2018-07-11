#          _                                _
#  _______| |__  _ __ ___   _ __   ___  ___| |_
# |_  / __| '_ \| '__/ __| | '_ \ / _ \/ __| __|
#  / /\__ \ | | | | | (__  | |_) | (_) \__ \ |_
# /___|___/_| |_|_|  \___| | .__/ \___/|___/\__|
#                          |_|

[[ -f ~/.platform.sh ]] && source ~/.platform.sh
[[ -f ~/.zsh/waterloo_aliases.zsh ]] && source ~/.zsh/waterloo_aliases.zsh
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.dircolors ]] && command -v dircolors &>/dev/null && eval $(dircolors ~/.dircolors)
