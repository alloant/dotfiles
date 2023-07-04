#!/bin/sh

mkfs.vfat -F 32 /dev/sdb1
mkfs.ext4 /dev/sdb2
mkfs.ext4 /dev/sdb3


