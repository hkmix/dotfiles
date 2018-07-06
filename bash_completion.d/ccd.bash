#!/bin/bash

if [ -z "$ZSH_NAME" ]; then
    shopt -s nullglob
else
    setopt nullglob
fi

_ccd() {
    local cur prev

    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "${prev}" in
        *)
            local projects
            projects=($HOME/Projects/*/)
            projects=("${projects[@]/%\//}")
            projects=("${projects[@]##*/}")
            COMPREPLY=("$(printf "%q\n" "${projects[@]}")")
            ;;
    esac
}

complete -F _ccd ccd
