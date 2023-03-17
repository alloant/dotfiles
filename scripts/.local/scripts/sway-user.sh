#!/bin/zsh
export XDG_SESSION_DESKTOP=sway
source ~/.profile

exec dbus-run-session sway
