#!/bin/sh

cpu_time0=$(cat /proc/stat | head -1 | awk '{print $2+$3+$4+$5+$6+$7+$8 " " $5}')
while true; do
    cpu_time=$(cat /proc/stat | head -1 | awk '{print $2+$3+$4+$5+$6+$7+$8 " " $5}')
    cpu_total=$(echo ${cpu_time} | awk '{print $1}')
    cpu_idle=$(echo ${cpu_time} | awk '{print $2}')
    cpu_total0=$(echo ${cpu_time0} | awk '{print $1}')
    cpu_idle0=$(echo ${cpu_time0} | awk '{print $2}')
    cpu_used=$(echo "scale=1; (${cpu_total}-${cpu_total0}-${cpu_idle}+${cpu_idle0})*100/(${cpu_total}-${cpu_total0})" | bc)
    echo ${cpu_used} > ~/.cache/mucpu_used
    cpu_time0=${cpu_time}
    sleep 2s
done
