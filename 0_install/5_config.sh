#!/bin/bash

mkdir -p ~/runit/service

ln -s ~/.config/sv/mako ~/runit/service
ln -s ~/.config/sv/mpd ~/runit/service
ln -s ~/.config/sv/mpDris2 ~/runit/service
ln -s ~/.config/sv/pipewire ~/runit/service
ln -s ~/.config/sv/swaybg ~/runit/service
ln -s ~/.config/sv/swayidle ~/runit/service
ln -s ~/.config/sv/udiskie ~/runit/service
ln -s ~/.config/sv/waybar ~/runit/service
ln -s ~/.config/sv/wireplumber ~/runit/service
ln -s ~/.config/sv/wl-clipboard ~/runit/service
ln -s ~/.config/sv/wlsunset ~/runit/service
ln -s ~/.config/sv/xdg-desktop-portal ~/runit/service

doas /etc/sv/avahi-daemon /var/service
doas /etc/sv/bluetoothd /var/service
doas /etc/sv/cupsd /var/service
doas /etc/sv/dbus /var/service
doas /etc/sv/dhcpcd /var/service
doas /etc/sv/elogind /var/service
doas /etc/sv/intel-undervolt /var/service
doas /etc/sv/iwd /var/service
doas /etc/sv/nanoklogd /var/service
doas /etc/sv/nftables /var/service
doas /etc/sv/polkitd /var/service
doas /etc/sv/socklog-unix /var/service
doas /etc/sv/tailscaled /var/service
doas /etc/sv/thermald /var/service
doas /etc/sv/tlp /var/service
doas /etc/sv/tor /var/service
doas /etc/sv/udevd /var/service
