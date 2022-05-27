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

dpi_scale=1.5

export jz_font_size_small='11'
export jz_font_size_medium='13'
export jz_font_size_large='15'
export jz_font_size_xlarge='17'

export jz_bar_height='32'
export jz_x11_dpi=$(calc -p "$dpi_scale * 96")
export jz_x11_cursor_size=$(calc -p "$dpi_scale * 32")
export jz_wallpaper_file='solarwall_1600p.png'

export jz_sway_config_extra=$(cat <<-ENDJZVAR
# Input settings.
input "1:1:AT_Translated_Set_2_keyboard" {
    xkb_layout "us"
    xkb_variant "hhkb_nobs"
    xkb_options "ctrl:nocaps"
    repeat_delay 250
    repeat_rate 30
}

input "1267:12725:ELAN074E:00_04F3:31B5_Touchpad" {
    click_method clickfinger
    middle_emulation enabled
    drag_lock enabled
    tap enabled
    tap_button_map lrm
}

# Output settings.
output "*" bg ~/Pictures/solarwall.png fill

output "eDP-1" {
    scale 1.5
}
ENDJZVAR
)
