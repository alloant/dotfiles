#!/bin/sh
#output=$(iwctl device wlan0 show | sed -n -e 's/^.*Powered: //p')
output="$(iwctl device wlan0 show | grep 'Powered' | grep 'off')"

if [ "$output" ]
then
    iwctl device wlan0 set-property Powered on
    notify-send -h int:transient:1 "WiFi" "On"
else
    iwctl device wlan0 set-property Powered off
    notify-send -h int:transient:1 "WiFi" "Off"
fi
