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

export jz_sway_config_extra=$(cat <<-ENDJZVAR
# Input settings.
input "1:1:AT_Translated_Set_2_keyboard" {
    xkb_layout "us"
    xkb_variant "hhkb_nobs"
    xkb_options "ctrl:nocaps"
    repeat_delay 250
    repeat_rate 30
}

input "2:10:TPPS/2_IBM_TrackPoint" {
    accel_profile adaptive
}

input "2:7:SynPS/2_Synaptics_TouchPad" {
    click_method none
    drag_lock enabled
    middle_emulation enabled
    pointer_accel 0.5
    tap enabled
    tap_button_map lrm
}

input "1739:52602:DLL08B0:01_06CB:CD7A_Touchpad" {
    click_method clickfinger
    middle_emulation enabled
    drag_lock enabled
    pointer_accel 0.4
    tap enabled
    tap_button_map lrm
}

input "1267:12734:MSFT0004:00_04F3:31BE_Touchpad" {
    click_method clickfinger
    middle_emulation enabled
    drag_lock enabled
    pointer_accel 0.4
    tap enabled
    tap_button_map lrm
}

# Output settings.
output "*" bg ~/Pictures/solarwall.png fill
ENDJZVAR
)

# X260 is the default configuration, so no overrides needed.
