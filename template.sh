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

valid_vars="$(env | grep jz_ | awk -F= '{ print "${" $1 "}" }' | xargs)"

shift
while [ $# -gt 0 ]; do
    file="$1"
    output_file="$(dirname "$file")/$(basename "$file" ".jztmpl")"
    echo "Expanding $file into $output_file"
    envsubst "$valid_vars" < "$file" > "$output_file"
    test -x "$file" && chmod -v +x "$output_file"
    shift
done
