#!/bin/sh
devices=$(bluetoothctl paired-devices | sed 's/Device //g')
selected_name=$(printf '%s' "$devices" | awk '{ $1 = ""; print $0 }' | wofi -d -p " ") 
selected_mac=$(echo "$devices" | grep "$selected_name" | awk '{ print $1 }')

connect=$(bluetoothctl connect "$selected_mac" | awk '/successful/ {print$2}' )

if [ "$connect" = "successful" ];then
	notify-send -i "bluetooth" "$selected_name" "Connected"
else
	notify-send -i "dialog-error" "$selected_name" "Connection cannot be reached"
fi
