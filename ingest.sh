#!/bin/sh

set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: $0 config_dir file_or_dir [file_or_dir ...]" >&2
    exit 1
fi

file_suffix=$(test $(basename "$0") = "ingest_as_jztmpl.sh" && echo ".jztmpl" || echo "")
config_dir="$1"
shift

current_dir="$(realpath $PWD)"
is_already_ingested() {
    case "$1" in
        "$current_dir"*)
            true;;
        *)
            false;;
    esac
}

for file in "$@"; do
    file_realpath=$(realpath "$file")
    if is_already_ingested "$file_realpath"; then
        echo "$file is already ingested, ignoring." >&2
        continue
    fi

    if test -h "$file"; then
        echo "Warning: $file is a symlink, copying as-is." >&2
    fi

    copied_path="$current_dir/$config_dir/$(realpath -s --relative-to "$HOME" "$file")$file_suffix"
    linked_path="$(realpath -s --relative-to "$(dirname $file)" $copied_path)"
    mkdir -p "$(dirname "$copied_path")"
    mv -v "$file" "$copied_path"

    if ! test -n "$file_suffix"; then
        ln -sv "$linked_path" "$file"
    fi
done
