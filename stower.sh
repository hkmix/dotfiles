#!/bin/sh

if [ $# -lt 2 -o ! -f "$1" ]; then
    echo "Usage: $0 vars_files/vars_file.sh config_dir [config_dir ...]" >&2
    exit 1
fi

config_file="$1"
shift

find $@ -iname *.jztmpl -exec ./template.sh "$config_file" {} \;
stow -v --no-folding --ignore='.*\.jztmpl' $@
