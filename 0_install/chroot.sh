#!/bin/sh

xbps-reconfigure -f glibc-locales

echo "Root password:"
passwd

cp /proc/mounts /etc/fstab

#echo "For BIOS"
#xbps-install grub
#grub-install /dev/sda

echo "UEFI"
xbps-install grub-x86_64-efi
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"

xbps-reconfigure -fa

exit
