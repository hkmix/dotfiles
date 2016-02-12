function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

NEWLINE=$'\n'
PROMPT=$NEWLINE"%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n) %{$fg_bold[blue]%}%~%{$fg_bold[yellow]%}%_$(gitinfo)%{$reset_color%}"$NEWLINE"%{$fg_bold[blue]%}%_$(prompt_char)%{$reset_color%} "
