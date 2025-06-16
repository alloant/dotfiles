nt=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

if [ $nt = "0" ]
then
    echo 1 | doas tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    notify-send "Conservation mode enabled"
else
    echo 0 | doas tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    notify-send "Conservation mode disabled"
fi

