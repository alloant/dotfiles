#!/bin/sh
output=$(bluetoothctl show | sed -n -e 's/^.*Powered: //p')

if [ $output = "no" ]
then
    bluetoothctl power on
    notify-send -h int:transient:1 "Bluetooth" "On"
else
    bluetoothctl power off
    notify-send -h int:transient:1 "Bluetooth" "Off"
fi
