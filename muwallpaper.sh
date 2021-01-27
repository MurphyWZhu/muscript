#!/bin/sh

feh --randomize --bg-fill ~/Pictures/wallpapers/
echo "90" > ~/.cache/muchwp
while true; do
    flag=$(cat ~/.cache/muchwp)
    if [ ${flag} -le 0 ]
    then
        feh --randomize --bg-fill ~/Pictures/wallpapers/
        echo "90" > ~/.cache/muchwp
    else
        echo "${flag}-1" | bc > ~/.cache/muchwp
    fi
    sleep 10s
done
