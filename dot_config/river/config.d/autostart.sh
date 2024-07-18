#!/usr/bin/env bash

# DBUS
riverctl spawn "dbus-update-activation-environment SEATD_SOCK DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river DBUS_SESSION_DBUS_ADDRESS"

riverctl spawn $HOME/.local/scripts/import-gsettings.sh
riverctl spawn $HOME/.config/river/layouts/default_layout.sh

#bash $HOME/.config/river/process.sh
riverctl spawn killall polkit-gnome-authentication-agent-1
riverctl spawn /usr/libexec/polkit-gnome-authentication-agent-1 &

riverctl spawn "wl-paste --watch cliphist store"
riverctl spawn mega-sync

# User defined services `runsvdir`
SVDIR=$HOME/runit/service
if [ $(pgrep -f -c "^runsvdir ${SVDIR}") = 0 ]
then
exec runsvdir ${SVDIR} \
    "log: ..........................................."
else
    echo "Service is already running"
fi
