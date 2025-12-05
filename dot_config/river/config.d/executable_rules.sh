#!/bin/sh
# Set repeat rate
riverctl set-repeat 50 300

# Set app-ids of views which should float
riverctl rule-add -app-id "mpv" float
riverctl rule-add -app-id "iwgtk" float
riverctl rule-add -app-id "float" float
riverctl rule-add -app-id "pavucontrol-qt" float
riverctl rule-add -app-id "polkit-gnome-authentication-agent-1" float

riverctl rule-add -title "synomail_ui.py" float
riverctl rule-add -title "Open" float
riverctl rule-add -title "Choose Files" float
riverctl rule-add -title "Select books" float
riverctl rule-add -title "Save As" float
riverctl rule-add -title "Confirm to replace files" float
riverctl rule-add -title "File Operation Progress" float
riverctl rule-add -title "Extension: (NoScript) - NoScript XSS Warning — Tor Browser" float

# Set app-ids of views which should use client side decorations
riverctl rule-add -app-id "swappy" csd

riverctl xcursor-theme Adwaita

riverctl default-layout stacktile

riverctl spawn "stacktile --per-tag-config --primary-count 1  --secondary-count 3 --primary-sublayout grid --primary-position left --primary-ratio 0.60 --outer-padding 0 --inner-padding 3 --secondary-sublayout rows --secondary-ratio 0.5 --remainder-sublayout stack" 

riverctl default-layout stacktile

