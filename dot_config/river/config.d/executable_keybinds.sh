#!/bin/sh

# Use the "logo" key as the primary modifier
mod="Super"
altmenu="~/.local/scripts/wofi_csv"

# Set your terminal emulator - foot
#term=$HOME/.local/bin/footq
#term=footclient
term=footclient

# App Bindings
riverctl map normal $mod Z spawn "qutebrowser"

riverctl map normal $mod X spawn "$term -e yazi"
riverctl map normal $mod+Shift B spawn "swaylock -f -c 000000"
riverctl map normal $mod B spawn ~/.local/scripts/wofi-bluetooth
riverctl map normal $mod N spawn ~/.local/scripts/iwd-dmenu
bind = $mainMod, M, exec, ~/.local/scripts/qutebookmarks.sh

riverctl map normal $mod C spawn 'passfuzzel --type'
riverctl map normal $mod+Shift C spawn passfuzzel

riverctl map normal $mod E spawn nvim-qt

riverctl map normal $mod L spawn "~/.local/scripts/getReadings.sh"
riverctl map normal $mod V spawn "$term --class float -e ~/.local/scripts/mpv-tor-clipboard.sh"

# Mod+Shift+Return to start an instance of foot (https://codeberg.org/dnkl/foot)
riverctl map normal $mod W spawn $term

# Mod+Q to close the focused view
riverctl map normal $mod Q close

# Mod+E to exit river
riverctl map normal $mod+Shift Q exit

# launcher
riverctl map normal $mod D spawn "fuzzel"

# view focus
riverctl map normal $mod Tab zoom

riverctl map normal $mod Right focus-view next
riverctl map normal $mod Left focus-view previous

# view in the layout stack
riverctl map normal $mod+Shift Right swap next
riverctl map normal $mod+Shift Left swap previous

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
riverctl map normal $mod+Alt H move left 100
riverctl map normal $mod+Alt J move down 100
riverctl map normal $mod+Alt K move up 100
riverctl map normal $mod+Alt L move right 100

# Mod+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal $mod+Alt+Control H snap left
riverctl map normal $mod+Alt+Control J snap down
riverctl map normal $mod+Alt+Control K snap up
riverctl map normal $mod+Alt+Control L snap right

# Mod+Alt+Shif+{H,J,K,L} to resize views
riverctl map normal $mod+Alt+Shift H resize horizontal -100
riverctl map normal $mod+Alt+Shift J resize vertical 100
riverctl map normal $mod+Alt+Shift K resize vertical -100
riverctl map normal $mod+Alt+Shift L resize horizontal 100


# Layout bindings

# Mod+D switch layout to user-defined default
riverctl map normal $mod+Shift D spawn $HOME/.config/river/layouts/default_layout.sh

# Mod+G switch to layout master grid
riverctl map normal $mod G spawn $HOME/.config/river/layouts/master_grid.sh

# Mod+M switch to layout monocle
riverctl map normal $mod M spawn $HOME/.config/river/layouts/monocle.sh

# Mod+Shift+R user-defined default
riverctl map normal $mod+Shift R send-layout-cmd stacktile "reset"

# Mod+, switch to layour master stack
riverctl map normal $mod comma spawn $HOME/.config/river/layouts/master_stack.sh



# view focus
riverctl map normal $mod Tab zoom

riverctl map normal $mod Right focus-view next
riverctl map normal $mod Left focus-view previous

# view in the layout stack
riverctl map normal $mod+Shift Right swap next
riverctl map normal $mod+Shift Left swap previous

# Mod+{Up,Right,Down,Left} to change layout orientation
riverctl map normal $mod+Control Up    send-layout-cmd stacktile "main-location top"
riverctl map normal $mod+Control Right send-layout-cmd stacktile "main-location right"
riverctl map normal $mod+Control Down  send-layout-cmd stacktile "main-location bottom"
riverctl map normal $mod+Control Left  send-layout-cmd stacktile "main-location left"

# main factor/count
riverctl map normal $mod+Alt Left send-layout-cmd stacktile 'main-ratio -0.05'
riverctl map normal $mod+Alt Right send-layout-cmd stacktile 'main-ratio +0.05'
riverctl map normal $mod+Alt Up send-layout-cmd stacktile 'main-count +1'
riverctl map normal $mod+Alt Down send-layout-cmd stacktile 'main-count -1'





# Send all windows to primary area
riverctl map normal $mod A send-layout-cmd stacktile "all_primary toggle"




# The scratchpad will live on an unused tag. Which tags are used depends on your
# config, but rivers default uses the first 9 tags.
scratch_tag=$((1 << 20 ))
# Toggle the scratchpad with Super+minus
riverctl map normal $mod minus toggle-focused-tags ${scratch_tag}

# Send windows to the scratchpad with Super+Shift+minus
riverctl map normal $mod+Shift minus set-view-tags ${scratch_tag}

# Set spawn tagmask to ensure new windows don't have the scratchpad tag unless
# explicitly set.
all_but_scratch_tag=$(( ((1 << 32) - 1) ^ $scratch_tag ))
riverctl spawn-tagmask ${all_but_scratch_tag}

# Back to previous tag
riverctl map normal $mod+Alt minus send-to-previous-tags

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


#; riverctl set-focused-tags 1024"

# One hidden tag for now acting as a scratchpad
#riverctl map normal $mod S set-focused-tags 512
#riverctl map normal $mod+Shift S spawn "riverctl set-view-tags 512; riverctl set-focused-tags 512"
#riverctl map normal $mod+Control S toggle-focused-tags 512
#riverctl map normal $mod+Shift+Control S toggle-view-tags 512

# One hidden tag for now acting as a work space
#riverctl map normal $mod W set-focused-tags 1024
#riverctl map normal $mod+Shift W spawn "riverctl set-view-tags 1024; riverctl set-focused-tags 1024"
#riverctl map normal $mod+Control W toggle-focused-tags 1024
#riverctl map normal $mod+Shift+Control W toggle-view-tags 1024

# One private tag not listed
riverctl map normal $mod P set-focused-tags 2048
riverctl map normal $mod+Shift P spawn "riverctl set-view-tags 2048; riverctl set-focused-tags 2048"
riverctl map normal $mod+Control P toggle-focused-tags 2048
riverctl map normal $mod+Shift+Control P toggle-view-tags 2048

# Mod+0 to focus all tags
# Mod+Shift+0 to tag focused view with all tags
all_tags=$(((1 << 32) - 1))
riverctl map normal $mod+Shift 0 set-focused-tags $all_tags
riverctl map normal $mod 0 set-view-tags $all_tags

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
riverctl map normal None XF86AudioRaiseVolume  spawn 'volumectl -u up'
riverctl map normal None XF86AudioLowerVolume  spawn 'volumectl -u down'
riverctl map normal None XF86AudioMute         spawn 'volumectl toggle-mute'
riverctl map normal None XF86AudioMicMute      spawn 'volumectl -m toggle-mute'


# Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
riverctl map locked None XF86AudioStop  spawn '~/.local/scripts/playing.sh stop'
riverctl map normal None XF86AudioStop  spawn '~/.local/scripts/playing.sh stop'
riverctl map normal None XF86AudioPlay  spawn '~/.local/scripts/playing.sh play-pause'
riverctl map normal None XF86AudioPrev  spawn '~/.local/scripts/playing.sh previous'
riverctl map normal None XF86AudioNext  spawn '~/.local/scripts/playing.sh next'

# Control screen backlight brighness with light (https://github.com/haikarainen/light)
riverctl map normal None XF86MonBrightnessUp   spawn 'lightctl up'
riverctl map normal None XF86MonBrightnessDown spawn 'lightctl down'

#riverctl map normal None XF86RFKill spawn '~/.local/scripts/wlan0-toggle.sh'

