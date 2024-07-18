#!/bin/zsh
export XDG_SESSION_DESKTOP=river
source ~/.profile

timestamp=$(date +%F-%R)
exec dbus-run-session river -log-level debug > /tmp/river-${timestamp}.log 2>&1
