#!/usr/bin/env sh

state="$(sv status ~/runit/service/gamma | grep 'run:')"

if [ "$state" ]; then
    sv down ~/runit/service/gamma
else
    sv up ~/runit/service/gamma
fi

