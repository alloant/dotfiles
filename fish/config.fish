source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

#starship init fish | source
#
if status is-login
    if test -z "$SSH_AUTH_SOCK"
        set -l keyring_env (gnome-keyring-daemon --start --components=secrets,ssh 2>/dev/null)
        for line in $keyring_env
            set -l item (string split -m 1 '=' (string replace -r ';.*$' '' $line))
            if test (count $item) -eq 2
                set -gx $item[1] $item[2]
            end
        end
    end
end
