#!/bin/sh
# Set repeat rate
riverctl set-repeat 50 300

# Set app-ids of views which should float
riverctl float-filter-add app-id "mpv"
riverctl float-filter-add app-id "iwgtk"
riverctl float-filter-add app-id "float"
riverctl float-filter-add app-id "pavucontrol-qt"
riverctl float-filter-add app-id "polkit-gnome-authentication-agent-1"

riverctl float-filter-add title "synomail_ui.py"
riverctl float-filter-add title "Open"
riverctl float-filter-add title "Choose Files"
riverctl float-filter-add title "Select books"
riverctl float-filter-add title "Save As"
riverctl float-filter-add title "Confirm to replace files"
riverctl float-filter-add title "File Operation Progress"
riverctl float-filter-add title "Extension: (NoScript) - NoScript XSS Warning — Tor Browser"

# Set app-ids of views which should use client side decorations
riverctl csd-filter-add app-id "swappy"

riverctl xcursor-theme Adwaita

riverctl default-layout stacktile

riverctl spawn "stacktile --per-tag-config --primary-count 1  --secondary-count 3 --primary-sublayout grid --primary-position left --primary-ratio 0.60 --outer-padding 0 --inner-padding 3 --secondary-sublayout rows --secondary-ratio 0.5 --remainder-sublayout stack" 

riverctl default-layout stacktile

