#!/usr/bin/env sh

fd="$(echo $1 | cut -d':' -f1)"
bn=$(basename $1)
mkdir -p /tmp/sshfs/$fd/$bn
sshfs $1 /tmp/sshfs/$fd/$bn
