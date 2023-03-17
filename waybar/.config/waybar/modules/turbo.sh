#!/bin/sh
turbo=$(cat /sys/devices/system/cpu/intel_pstate/no_turbo)

if [ $turbo = "0" ]
then
    echo "{\"alt\":\"on\",\"class\":\"on\"}"
else
    echo "{\"alt\":\"off\",\"class\":\"off\"}"
fi
