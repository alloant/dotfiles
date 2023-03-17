#!/bin/zsh
export XDG_SESSION_DESKTOP=qtile
source ~/.profile

timestamp=$(date +%F-%R)
exec dbus-run-session qtile start -b wayland
