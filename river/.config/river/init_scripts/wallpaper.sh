#!/usr/bin/env bash

killall -q wbg
while pgrep -x wbg >/dev/null; do sleep 1; done
exec wbg ~/.config/river/wall.png
#exec swaybg -m fill -i ~/.config/river/wall.png
