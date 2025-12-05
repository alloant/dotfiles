#!/bin/sh
turbo=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

if [ $turbo = "1" ]
then
    echo "{\"alt\":\"on\",\"class\":\"on\"}"
else
    echo "{\"alt\":\"off\",\"class\":\"off\"}"
fi
