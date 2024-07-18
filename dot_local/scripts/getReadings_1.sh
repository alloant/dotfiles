#!/bin/bash

args=$(fuzzel -d)

first=$(echo $args | awk '{ print $1 }')

if [[ "$first" == 'Mk' || "$first" == 'Mt' || "$first" == 'Lk' || "$first" == 'Jn' ]]
then
    ~/.local/scripts/get_NT.sh $args | wl-copy
else
   ~/.local/scripts/getReadings.py $args
fi
