mount /dev/sdb2 /mnt

mkdir -p /mnt/boot/efi
mount /dev/sdb1 /mnt/boot/efi

mkdir -p /mnt/home
mount /dev/sdb3 /mnt/home


REPO=https://repo-default.voidlinux.org/current
ARCH=x86_64

mkdir -p /mnt/var/db/xbps/keys
cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/

XBPS_ARCH=$ARCH xbps-install -S -r /mnt -R "$REPO" base-system iwd dhcpcd git

xchroot /mnt /bin/bash -c chroot.sh

#umount -R /mnt

#shutdown -r now
