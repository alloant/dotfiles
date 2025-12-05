#!/bin/sh

powered="$(bluetoothctl show | grep 'Powered: yes')"

if [ "$powered" ]; then
    ~/.config/waybar/modules/waybar_blupower.py $powered	
    #text="bt"
    #tooltip="$(~/.config/waybar/modules/waybar_blupower.py $powered)"
    #tooltip=""
    #echo "{\"alt\":\"on\",\"text\":\"$text\",\"tooltip\":\"$tooltip\"}"
else
	echo "{\"alt\":\"off\"}"
fi
