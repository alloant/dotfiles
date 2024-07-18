nt=$(cat /sys/devices/system/cpu/intel_pstate/no_turbo)
#doas cpupower frequency-set -u 2.2Ghz
if [ $nt = "0" ]
then
    echo 1 | doas tee-turbo
    notify-send "Turbo disabled"
else
    echo 0 | doas tee-turbo
    notify-send "Turbo enabled"
fi

