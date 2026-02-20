#!/bin/sh

state="$(sv status ~/runit/service/gamma | grep 'run:')"

if [ "$state" ]; then
    echo "{\"alt\":\"on\"}"
else
    echo "{\"alt\":\"off\"}"
fi
