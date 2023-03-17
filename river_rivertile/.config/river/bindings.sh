#!/bin/sh

# Use the "logo" key as the primary modifier
mod="Mod4"

# Set your terminal emulator - foot
#term=$HOME/.local/bin/footq
term=alacritty

# App Bindings
riverctl map normal $mod Z spawn qutebrowser

riverctl map normal $mod+Mod1 C spawn 'clipman pick -t wofi'
riverctl map normal $mod X spawn "$term -e lf-tmux"
riverctl map normal $mod+Shift B spawn "swaylock -f -c 000000"
riverctl map normal $mod B spawn wofi-bluetooth
riverctl map normal $mod N spawn iwd-dmenu

riverctl map normal $mod C spawn 'passmenu --type'
riverctl map normal $mod+Shift C spawn passmenu

riverctl map normal $mod+Shift D spawn '$altmenu Menu'
riverctl map normal $mod+Shift Q spawn '$altmenu Power'
riverctl map normal $mod E spawn nvim-qt
riverctl map normal $mod M spawn ncmpcpp
riverctl map normal $mod O spawn ~/.config/river/scripts/screenOnOff.sh

riverctl map normal $mod V spawn "$term --class float -e ~/.config/river/scripts/mpv-tor-clipboard.sh"

# Screenshot scripts
#riverctl map normal "None" Print spawn $HOME/.local/bin/mygrimshot.sh
#riverctl map normal "$mod" Print spawn '$HOME/.local/bin/mygrimshot.sh area'

# Mod+Shift+Return to start an instance of foot (https://codeberg.org/dnkl/foot)
riverctl map normal $mod Return spawn $term

# Mod+Q to close the focused view
riverctl map normal $mod Q close

# Mod+E to exit river
riverctl map normal $mod+Shift E exit

# launcher
riverctl map normal $mod D spawn 'j4-dmenu-desktop --dmenu="wofi -d -i"'
#riverctl map normal Alt D spawn wofi
# view focus
riverctl map normal $mod Tab zoom

riverctl map normal $mod Right focus-view next
riverctl map normal $mod Left focus-view previous

# view in the layout stack
riverctl map normal $mod+Shift Right swap next
riverctl map normal $mod+Shift Left swap previous

# Mod+{Up,Right,Down,Left} to change layout orientation
riverctl map normal $mod+Control Up    send-layout-cmd rivertile "main-location top"
riverctl map normal $mod+Control Right send-layout-cmd rivertile "main-location right"
riverctl map normal $mod+Control Down  send-layout-cmd rivertile "main-location bottom"
riverctl map normal $mod+Control Left  send-layout-cmd rivertile "main-location left"

# main factor/count
riverctl map normal $mod+Mod1 Left send-layout-cmd rivertile 'main-ratio -0.05'
riverctl map normal $mod+Mod1 Right send-layout-cmd rivertile 'main-ratio +0.05'
riverctl map normal $mod+Mod1 Up send-layout-cmd rivertile 'main-count +1'
riverctl map normal $mod+Mod1 Down send-layout-cmd rivertile 'main-count -1'

# move/resize
riverctl map-pointer normal $mod BTN_LEFT move-view
riverctl map-pointer normal $mod BTN_RIGHT resize-view

# toggle float/fullscreen
riverctl map normal $mod grave toggle-float
riverctl map normal $mod F toggle-fullscreen

# multi-output
riverctl map normal $mod Period focus-output next
riverctl map normal $mod Comma focus-output previous
riverctl map normal $mod+Shift Period send-to-output next
riverctl map normal $mod+Shift Comma send-to-output previous

# screenshots
riverctl map normal $mod S spawn 'grim -g "$(slurp)" - | wl-copy'

# Mod+Alt+{H,J,K,L} to move views
riverctl map normal $mod+Mod1 H move left 100
riverctl map normal $mod+Mod1 J move down 100
riverctl map normal $mod+Mod1 K move up 100
riverctl map normal $mod+Mod1 L move right 100

# Mod+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal $mod+Mod1+Control H snap left
riverctl map normal $mod+Mod1+Control J snap down
riverctl map normal $mod+Mod1+Control K snap up
riverctl map normal $mod+Mod1+Control L snap right

# Mod+Alt+Shif+{H,J,K,L} to resize views
riverctl map normal $mod+Mod1+Shift H resize horizontal -100
riverctl map normal $mod+Mod1+Shift J resize vertical 100
riverctl map normal $mod+Mod1+Shift K resize vertical -100
riverctl map normal $mod+Mod1+Shift L resize horizontal 100

# The scratchpad will live on an unused tag. Which tags are used depends on your
# config, but rivers default uses the first 9 tags.
scratch_tag=$((1 << 20 ))
# Toggle the scratchpad with Super+P
riverctl map normal $mod minus toggle-focused-tags ${scratch_tag}

# Send windows to the scratchpad with Super+Shift+P
riverctl map normal $mod+Shift minus set-view-tags ${scratch_tag}

# Set spawn tagmask to ensure new windows don't have the scratchpad tag unless
# explicitly set.
all_but_scratch_tag=$(( ((1 << 32) - 1) ^ $scratch_tag ))
riverctl spawn-tagmask ${all_but_scratch_tag}

# Back to previous tag
riverctl map normal $mod+Mod1 minus send-to-previous-tags

# Mod + Left Mouse Button to move views
riverctl map-pointer normal $mod BTN_LEFT move-view

# Mod + Right Mouse Button to resize views
riverctl map-pointer normal $mod BTN_RIGHT resize-view

for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1))) # Ask ifreund why he does this. It makes sense though.

    # Mod+[1-9] to focus tag [0-8]
    riverctl map normal $mod $i set-focused-tags $tags

    # Mod+Shift+[1-9] to tag focused view with tag and also move window with it. [0-8]
    # I made it like this because I want to move the stuff and the views at the same time. weird hack
    riverctl map normal $mod+Shift $i spawn "riverctl set-view-tags $tags; riverctl set-focused-tags $tags"  

    # Mod+Ctrl+[1-9] to toggle focus of tag [0-8]
    riverctl map normal $mod+Control $i toggle-focused-tags $tags

    # Mod+Shift+Ctrl+[1-9] to toggle tag [0-8] of focused view
    riverctl map normal $mod+Shift+Control $i toggle-view-tags $tags
done



# One hidden tag for now acting as a scratchpad
#riverctl map normal $mod S set-focused-tags 512
#riverctl map normal $mod+Shift S spawn "riverctl set-view-tags 512; riverctl set-focused-tags 512"
#riverctl map normal $mod+Control S toggle-focused-tags 512
#riverctl map normal $mod+Shift+Control S toggle-view-tags 512

# One hidden tag for now acting as a work space
riverctl map normal $mod W set-focused-tags 1024
riverctl map normal $mod+Shift W spawn "riverctl set-view-tags 1024; riverctl set-focused-tags 1024"
riverctl map normal $mod+Control W toggle-focused-tags 1024
riverctl map normal $mod+Shift+Control W toggle-view-tags 1024

# One private tag not listed
riverctl map normal $mod P set-focused-tags 2048
riverctl map normal $mod+Shift P spawn "riverctl set-view-tags 2048; riverctl set-focused-tags 2048"
riverctl map normal $mod+Control P toggle-focused-tags 2048
riverctl map normal $mod+Shift+Control P toggle-view-tags 2048

# Mod+0 to focus all tags
# Mod+Shift+0 to tag focused view with all tags
all_tags=$(((1 << 32) - 1))
riverctl map normal $mod 0 set-focused-tags $all_tags
riverctl map normal $mod+Shift 0 set-view-tags $all_tags

# Mod+Space to toggle float
riverctl map normal $mod grave toggle-float

# Mod+F to toggle fullscreen
riverctl map normal $mod F toggle-fullscreen


# Declare a passthrough mode. This mode has only a single mapping to return to
# normal mode. This makes it useful for testing a nested wayland compositor
riverctl declare-mode passthrough

# Mod+F11 to enter passthrough mode
riverctl map normal $mod F11 enter-mode passthrough

# Mod+F11 to return to normal mode
riverctl map passthrough $mod F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked
do
    # Eject the optical drive
    riverctl map $mode None XF86Eject spawn eject -T

done

# Touchpad

touchpad_device=$(riverctl list-inputs | grep -i touchpad)
riverctl input $touchpad_device events enabled
riverctl input $touchpad_device natural-scroll enabled
riverctl input $touchpad_device tap enabled
riverctl input $touchpad_device tap-button-map left-right-middle

# Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
riverctl map normal None XF86AudioRaiseVolume  spawn 'ponymix -t sink increase 5'
riverctl map normal None XF86AudioLowerVolume  spawn 'ponymix -t sink decrease 5'
riverctl map normal None XF86AudioMute         spawn 'ponymix -t sink toggle'
riverctl map normal None XF86AudioMicMute         spawn 'ponymix -t source toggle'

# Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
riverctl map normal None XF86AudioStop  spawn '~/.scripts/playing.sh stop'
riverctl map normal None XF86AudioPlay  spawn '~/.scripts/playing.sh play-pause'
riverctl map normal None XF86AudioPrev  spawn '~/.scripts/playing.sh previous'
riverctl map normal None XF86AudioNext  spawn '~/.scripts/playing.sh next'

# Control screen backlight brighness with light (https://github.com/haikarainen/light)
riverctl map normal None XF86MonBrightnessUp   spawn 'light -A 5%'
riverctl map normal None XF86MonBrightnessDown spawn 'light -U 5%'

# Set repeat rate
riverctl set-repeat 50 300

# Set app-ids of views which should float
riverctl float-filter-add app-id "mpv"
riverctl float-filter-add app-id "iwgtk"
riverctl float-filter-add app-id "float"

# Set app-ids of views which should use client side decorations
riverctl csd-filter-add app-id "swappy"

riverctl xcursor-theme Adwaita

riverctl default-layout rivertile

