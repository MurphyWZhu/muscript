#!/bin/sh

volume=$(pamixer --get-volume)
volume_human=$(pamixer --get-volume-human)
if [ $volume_human = "0%" -o $volume_human = "muted" ]
then
    volume_show="🔇️"
elif [ $volume -le 30 ]
then
    volume_show="🔈${volume_human}"
elif [ $volume -ge 70 ]
then
    volume_show="🔊${volume_human}"
else
    volume_show="🔉${volume_human}"
fi
batt=$(acpi -b | awk '{ print $4 }' | tr -d ',')
if acpi -a | grep on-line &> /dev/null
then
    batt_show="⚡️️${batt}"
else
    batt_show="🔋️${batt}"
fi
light=$(light -G)
light=$(echo "scale=0; ($(light))/1" | bc)
light_show="💡️${light}%"
mem=$(LANG=en_US.UTF-8 free -h | grep Mem | awk '{ printf "%-s",$3 }')
memp=$(LANG=en_US.UTF-8 free | grep Mem | awk '{ printf "%.1f%",$3 / $2 * 100 }')
mem_show="💻${memp}"

xinput list | grep pointer | grep -vE "Virtual core|ETPS/2 Elantech Touchpad" &> /dev/null
if [ $? -eq 0 ]
then
    xinput disable "ETPS/2 Elantech Touchpad"
    xinput_show="🖱️"
else
    xinput enable "ETPS/2 Elantech Touchpad"
    xinput_show="👆"
fi

# echo "${mem_show} ${light_show} ${batt_show} ${volume_show} $( date +"%R" ) ${xinput_show}"
xsetroot -name "${mem_show} ${light_show} ${batt_show} ${volume_show} 🕔$( date +"%R" ) ${xinput_show}"
