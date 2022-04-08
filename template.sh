#!/bin/sh

if ! command -v envsubst >/dev/null 2>&1; then
    echo "envsubst not found, cannot proceed" >&2
    exit 1
fi

if [ $# -lt 1 ]; then
    echo "Usage: $0 vars_file.sh jztmpl_file [jztmpl_file ...]" >&2
    echo >&2
    echo "The vars file is sourced, please be careful with what is put in it!" >&2
    exit
fi

vars_file="$1"
source $vars_file

shift
while [ $# -gt 0 ]; do
    file="$1"
    output_file="$(dirname "$file")/$(basename "$file" ".jztmpl")"
    echo "Expanding $file into $output_file"
    envsubst < "$file" > "$output_file"
    shift
done
