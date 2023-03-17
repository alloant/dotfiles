#!/bin/bash
#doas runtime-antonio

export MOZ_ENABLE_WAYLAND=1
export CLUTTER_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export ECORE_EVAS_ENGINE=wayland
export ELM_ENGINE=wayland
#export ECORE_EVAS_ENGINE=wayland-egl
#export ELM_ENGINE=wayland_egl
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
export QT_QPA_PLATFORMTHEME=qt5ct
export BEMENU_BACKEND=wayland
export BEMENU_OPTS="-i -l --tb white --fn 'Noto Sans Mono 12'"
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export LIBVA_DRIVER_NAME=iHD

export GTK_USE_PORTAL=0

#export XDG_DATA_DIRS=/home/antonio/.local/share/flatpak/exports/share
export EDITOR=nvim
#export SHELL=zsh
export OPENER=xdg-open

#mkdir /tmp/swaytmp
#export XDG_RUNTIME_DIR=/tmp/swaytmp
#sway $@

#if test -z "${XDG_RUNTIME_DIR}"; then
#    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
#    if ! test -d "${XDG_RUNTIME_DIR}"; then
#        mkdir "${XDG_RUNTIME_DIR}"
#        chmod 0700 "${XDG_RUNTIME_DIR}"
#    fi
#fi
#export XDG_RUNTIME_DIR=/run/user/1000

#exec dbus-launch --sh-syntax --exit-with-session sway
exec dbus-run-session sway

#exec sway
