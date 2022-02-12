#!/bin/sh

check_run() {
    command -v "$1" >/dev/null 2>&1 && $("$@")
}

xrdb -merge ~/.Xresources

# GNOME Keyring.
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

check_run numlockx on
check_run syndaemon -i 2 -d -t -K &
check_run xset r rate 300 30 &
check_run ibus-daemon -drx
check_run insync start &
check_run ~/.fehbg &
check_run redshift -m wayland -l 43.5:-80 -t 6500K:3500K &

exec i3
