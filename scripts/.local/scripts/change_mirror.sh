#!/usr/bin/env sh

old_repo=$(awk -F '=' '{print $2}' /etc/xbps.d/00-repository-main.conf | awk -F 'current' '{print $1}')

sed -i 's|$1|$old_repo|g' /etc/xbps.d/*-repository-*.conf
