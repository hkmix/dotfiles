#!/bin/sh

sudo cat >>/usr/share/X11/xkb/symbols/us <<EOF

partial modifier_keys
xkb_symbols "hhkb" {
	include "us(basic)"
    key <BKSP> { [ backslash, bar ] };
    key <BKSL> { [ BackSpace, BackSpace ] };

    key <LALT> { type[Group1] = "ONE_LEVEL",
                 symbols[Group1] = [ Super_L ] };
    key <LWIN> { [ Alt_L, Meta_L ] };
};
EOF
