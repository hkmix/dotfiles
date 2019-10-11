#!/bin/sh

xrdb -merge ~/.Xresources

# GNOME Keyring.
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

numlockx on
syndaemon -i 2 -d -t -K &
xset r rate 300 30 &
insync start &
~/.fehbg &
redshift -l 43.5:-80 -t 6500K:3500K &

exec i3
