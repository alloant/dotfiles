set -U fish_greeting

fish_add_path ~/.local/bin
fish_add_path ~/.local/scripts

if status is-login
    dbus-run-session Hyprland
end

#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

starship init fish | source
