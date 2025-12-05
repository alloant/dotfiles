nt=$(cat /sys/devices/system/cpu/intel_pstate/no_turbo)

if [ $nt = "0" ]
then
    doas toggle-turbo 1
    notify-send "Turbo disabled"
else
    doas toggle-turbo 0
    notify-send "Turbo enabled"
fi

