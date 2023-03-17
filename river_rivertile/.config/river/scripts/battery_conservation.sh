#!/bin/sh
read bcm < /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
    if [ "$bcm" -eq "0" ]; then
        echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
    else
        echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
    fi
