export PS1="(CHROOT)# "

apk add linux-lts tzdata
apk add iwd
grep -E 'xfs|vfat|btrfs|ext4|f2fs' /proc/mounts >> /etc/fstab
echo none /tmp tmpfs rw,defaults 0 0 >> /etc/fstab
setup-interfaces

setup-sshd
setup-ntp

for svc in devfs dmesg hwdrivers mdev ; do rc-update add $svc sysinit ; done

for svc in bootmisc hostname hwclock lvm modules networking \
              seedrng swap sysctl syslog ; do rc-update add $svc boot ; done

for svc in acpid crond klogd local ; do rc-update add $svc default ; done

sed -i.bak -e's/ext4/ext4 xfs btrfs lvm cryptsetup/' \
            /etc/mkinitfs/mkinitfs.conf

mkinitfs $(ls -t /lib/modules | sed 1q) # Note if `ls` is aliased, use `command ls` to avoid a trailing slash

efibootmgr -c -p 1 -d /dev/<device>1 -L Alpine -l /vmlinuz-lts \
-u 'initrd=/initramfs-lts cryptroot=/dev/<device>2 cryptdm=crypt root=/dev/vg/root rootfstype=xfs rootflags=rw' \
passwd

exit
