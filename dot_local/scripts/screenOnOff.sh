#!/bin/zsh
enabled=$(wlr-randr --output eDP-1 | grep Enabled | awk '{ print $2 }')

if [[ "$enabled" -eq "yes" ]]; then
    wlr-randr --output "eDP-1" --off
else
    wlr-randr --output "eDP-1" --on
fi
