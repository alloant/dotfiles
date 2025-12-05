#!/bin/sh

state="$(sv status ~/runit/service/wlsunset | grep 'run:')"

if [ "$state" ]; then
    echo "{\"alt\":\"on\"}"
else
    echo "{\"alt\":\"off\"}"
fi
