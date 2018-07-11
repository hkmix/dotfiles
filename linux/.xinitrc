numlockx on

xrdb -merge ~/.Xresources
setxkbmap -device $(~/.bin/get-xinput-id "AT Translated Set 2 keyboard") -variant hhkb

syndaemon -i 1 -d -t -K &
xset r rate 300 30 &
insync-headless start &
~/.fehbg &
redshift -l 43.5:-80 -t 6500K:3500K &
compton -b &
emacs --daemon &

exec i3
