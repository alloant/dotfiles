set -U fish_greeting

fish_add_path ~/.local/bin
fish_add_path ~/.local/scripts

if status is-login
    #dbus-run-session start-hyprland
    dbus-run-session mango
    #dbus-run-session Hyprland
    #~/.local/scripts/river-user.sh
end

#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

starship init fish | source
