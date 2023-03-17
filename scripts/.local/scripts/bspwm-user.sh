#!/bin/zsh
export XDG_SESSION_DESKTOP=bspwm
source ~/.profile

timestamp=$(date +%F-%R)
exec dbus-run-session bspwm
