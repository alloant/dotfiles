#!/usr/bin/env bash

if [ -e /run/user/1000/river_first ]
then
    echo "file exists"
else
    batsignal -b &
    echo 1 > /run/user/1000/river_first
fi
