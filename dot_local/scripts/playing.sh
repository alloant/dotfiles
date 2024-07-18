#!/bin/zsh

ismpv=$(playerctl --list-all | grep mpv)

if [ "$ismpv" = "mpv" ]
then
    playerctl -p mpv $1
else
    playerctl -a $1
fi
