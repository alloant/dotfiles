#!/bin/sh

alias pb="parted -sa optimal /dev/sdb"

pb mklabel gpt
pb mkpart p 0G 512M
pb mkpart p 512M 20G
pb mkpart p 20G 100%
pb set 1 esp

