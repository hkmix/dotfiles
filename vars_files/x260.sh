#!/bin/sh

# +----------+
# | Preamble |
# +----------+
# This should be sourced by template.sh, so we expect the file to be at $1.
if [ $# -lt 1 ]; then
    echo "Warning: This file must be sourced by template.sh"
    exit
fi

this_script="$1"
this_dir="$(dirname "$this_script")"

. $this_dir/default_vars.sh
# +--------------+
# | End preamble |
# +--------------+

# X260 is the default configuration, so no overrides needed.
