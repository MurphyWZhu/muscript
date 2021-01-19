#!/bin/sh

xinput disable "ETPS/2 Elantech Touchpad"
picom -b --backend glx
feh --randomize --bg-fill ~/Pictures/wallpapers/
xss-lock ~/.config/muscript/muxss-lock.sh &
while true; do
        ~/.config/muscript/mudwmbar.sh
    sleep 2s
done &
~/.config/muscript/cpuused.sh &
nm-applet &
fcitx5 &
