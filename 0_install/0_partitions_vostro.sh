#!/bin/sh

alias pa="parted -sa optimal /dev/sda"
alias pb="parted -sa optimal /dev/sdb"

pa mklabel msdos
pa mkpart p 0G 1G
pa mkpart p 1G 20G
pa mkpart p 20G 100%
pa set 1 boot

mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

pb mklabel msdos
pb mkpart p 0G 16G
pb mkpart p 16G 31G
pb mkpart p 31G 100%

mkfs.ext4 /dev/sdb1
mkswap /dev/sdb2
mkfs.ext4 /dev/sdb3

mount /dev/sda2 /mnt

mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

mkdir -p /mnt/home
mount /dev/sda3 /mnt/home

mkdir -p /mnt/var
mount /dev/sdb2 /mnt/var

mkdir -p /mnt/data
mount /dev/sdb3 /mnt/data

swapon /dev/sdb1

