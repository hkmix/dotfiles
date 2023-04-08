#!/bin/sh

_block_header='HHKB XKB BLOCK'
_target_file=/usr/share/X11/xkb/symbols/us

grep -o "$_block_header" "$_target_file" >/dev/null && echo "Nothing to be done." || sudo cat >>"$_target_file" <<EOF

// BEGIN $_block_header
partial modifier_keys
xkb_symbols "hhkb" {
    include "us(basic)"
    key <END> { [ Insert ] };
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };

    key <LALT> { type[Group1] = "ONE_LEVEL",
                 symbols[Group1] = [ Super_L ] };
    key <LWIN> { [ Alt_L, Meta_L ] };
};

partial modifier_keys
xkb_symbols "hhkb_nobs" {
    include "us(basic)"
    key <END> { [ Insert ] };
    key <LALT> { type[Group1] = "ONE_LEVEL",
                 symbols[Group1] = [ Super_L ] };
    key <LWIN> { [ Alt_L, Meta_L ] };
};
// END $_block_header
EOF
