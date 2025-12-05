#!/bin/sh

idle="$(sv status ~/runit/service/swayidle | grep 'run:')"

if [ "$idle" ]; then
    echo "{\"alt\":\"on\"}"
else
    echo "{\"alt\":\"off\"}"
fi
