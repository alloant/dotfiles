#!/usr/bin/env sh

state="$(sv status ~/runit/service/wlsunset | grep 'run:')"

if [ "$state" ]; then
    sv down ~/runit/service/wlsunset
else
    sv up ~/runit/service/wlsunset
fi

