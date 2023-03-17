#!/usr/bin/env sh

#state="$(sv status ~/runit/service/wlsunset | grep 'run:')"
state=$(ps -e | grep wlsunset)

if [ "$state" ]; then
    killall wlsunset
else
    wlsunset
fi

