#!/usr/bin/env bash

# DBUS
riverctl spawn "dbus-update-activation-environment SEATD_SOCK DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=river DBUS_SESSION_DBUS_ADDRESS QT_QPA_PLATFORMTHEME"

riverctl spawn $HOME/.local/scripts/import-gsettings.sh
riverctl spawn $HOME/.config/river/layouts/default_layout.sh

#bash $HOME/.config/river/process.sh
riverctl spawn killall polkit-gnome-authentication-agent-1
riverctl spawn /usr/libexec/polkit-gnome-authentication-agent-1

riverctl spawn lightctl 60%
riverctl spawn ~/.local/xdg-desktop

riverctl spawn foot -s
riverctl spawn iwgtk -i
riverctl spawn mega-sync

riverctl spawn sway-audio-idle-inhibit
riverctl spawn avizo-service
riverctl spawn ~/.local/scripts/svdir.sh

riverctl spawn wl-paste -t text --watch clipman store -P
riverctl spawn wl-paste -p -t text --watch clipman store -P
riverctl spawn blueman-applet
