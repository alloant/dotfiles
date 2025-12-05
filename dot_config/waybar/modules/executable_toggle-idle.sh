#!/bin/sh

idle="$(sv status ~/runit/service/swayidle | grep 'run:')"

if [ "$idle" ]; then
    sv down ~/runit/service/swayidle
else
    sv up ~/runit/service/swayidle
fi

