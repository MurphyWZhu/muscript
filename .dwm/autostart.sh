#!/bin/sh

xinput disable "ETPS/2 Elantech Touchpad"
picom -b
feh --randomize --bg-fill /usr/share/murch-wallpaper
xss-lock ~/.config/muscript/muxss-lock.sh &
while true; do
        #xsetroot -name "$(pamixer --get-volume-human) ⌚$( date +"%R" )"
        ~/.config/muscript/mudwmbar.sh
    sleep 2s
done &
nm-applet &
fcitx &
