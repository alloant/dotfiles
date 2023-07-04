#!/bin/bash

# Firmware
xbps-install -A intel-ucode linux-firmware-intel linux-firmware-amd

# Cron
xbps-install -A snooze

# Security
xbps-install -A apparmor vpnfailsafe

# Date and time
xbps-install -A chrony

# Power
xbps-install -A tlp thermald intel-undervolt upower

# Network
xbps-install -A iwd iwgtk
xbps-install -A openfortivpn openresolv
xbps-install -A tor torsocks
xbps-install -A tailscale wireguard-tools nmap

# Session
xbps-install -A elogind dbus-elogind dbus-glib

# Graphical drivers
xbps-install -A mesa-dri mesa-intel-dri mesa-vaapi mesa-vdpau mesa-vulkan-intel mesa-vulkan-radeon vulkan-loader amdvlk
xbps-install -A libva-glx libva-vdpau-driver intel-video-accel

# Wayland
xbps-install -A qt5-wayland qt6-wayland glfw-wayland

# Fonts
xbps-install -A font-awesome5 font-hack-ttf noto-fonts-ttf noto-fonts-ttf-extra

#Pipewire
xbps-install -A pipewire wireplumber libspa-bluetooth alsa-pipewire libjack-pipewire
xbps-install -A pavucontrol-qt easyeffects
xbps-install -A mpDris2 mpd playerctl

# Bluetooth
xbps-install -A bluez bluez-cups

# Flatpak
xbps-install -A flatpak
xbps-install -A xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr xdg-user-dirs xdg-user-dirs-gtk xdg-utils

# Printers
xbps-install -A cups cups-filters cups-pdf
xbps-install -A avahi nss-mdns
xbps-install -A system-config-printer cups-pk-helper

# GnuPG
xbps-install -A gnupg

# Polkit
xbps-install -A polkit-elogind polkit-gnome

# Sway/River
xbps-install -A sway swayidle swaylock
xbps-install -A river
xbps-install -A Waybar fuzzel wbg wdisplays wl-clipboard wlr-randr wlsunset wtype libappindicator mako lswt light

# Theme
xbps-install -A qt5ct qt6ct

# Video player
xbps-install -A mpv mpv-mpris
xbps-install -A gst-libav gst-plugins-good1 gst-plugins-ugly1 gstreamer-vaapi gstreamer1-pipewire

# Image
xbps-install -A imv


# Android
xbps-install -A android-file-transfer-linux android-tools android-udev-rules

# Terminals
xbps-install -A alacritty foot tmux zsh

# Programing
xbps-install -A python3-pip ruby

# File manager, terminal tools and compress
xbps-install -A lf duf exa fd ncdu
xbps-install -A neovim neovim-qt
xbps-install -A atool p7zip unrar zip
xbps-install -A parted
xbps-install -A zathura zathura-cb zathura-pdf-mupdf

# Internet
xbps-install -A curl lux git MEGAcmd MEGAsdk wget yt-dlp

# System-tools
xbps-install -A clipman ctags htop cifs-utils gocryptfs pam_rundir pandoc pass passmenu stow socklog-void lm_sensors udiskie zzz-user-hooks vsv xtools

# System
xbps-install -A fwupd fuse-sshfs nftables opendoas void-repo-nonfree

# Applications
xbps-install -A calibre chromium freerdp gimp grim libreoffice luakit mkvtoolnix-gui qemu scribus sqlitebrowser
