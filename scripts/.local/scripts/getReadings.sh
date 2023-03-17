#!/bin/bash

args=$(wofi -d)

first=$(echo $args | awk '{ print $1 }')

if [[ "$first" == 'Mk' || "$first" == 'Mt' || "$first" == 'Lk' || "$first" == 'Jn' ]]
then
    ~/.scripts/get_NT.sh $args | wl-copy
else
   ~/.scripts/getReadings.py $args
fi
