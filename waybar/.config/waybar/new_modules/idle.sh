#!/bin/sh

#idle="$(sv status ~/runit/service/swayidle | grep 'run:')"
idle="$(ps -e | grep 'swayidle')"

if [ "$idle" ]; then
    echo "{\"alt\":\"on\"}"
else
    echo "{\"alt\":\"off\"}"
fi
