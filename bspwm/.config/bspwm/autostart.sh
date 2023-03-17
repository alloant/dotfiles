#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

eval "$(dbus-launch --sh-syntax --exit-with-session 'bspwm')" &
#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

# User defined services `runsvdir`
SVDIR=$HOME/runit/service
if [ $(pgrep -f -c "^runsvdir ${SVDIR}") = 0 ]
then
exec runsvdir ${SVDIR} \
    "log: ..........................................."
else
    echo "Service is already running"
fi



env DESKTOP_SESSION=bspwm $HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-scale ~/.config/bspwm/wall.png &
xsetroot -cursor_name left_ptr &
sxhkd &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
numlockx on &
compton --config $HOME/.config/bspwm/compton.conf &
dunst &
unclutter -idle 5 &
#devmon &
#setxkbmap -layout us,us -variant intl -option “grp:alt_shift_toggle,grp_led:scroll” &
#xautolock -time 5 -locker '$HOME/.local/bin/slock_video' &
xss-lock -- i3lock -c 000000 -n &
xautolock -time 5 -locker "i3lock -c 000000" &
xset -b
xset s 600 600
redshift-gtk &
