# Aliases
aliases['exa'] = "exa --color=auto --group-directories-first"
aliases['ls'] = "exa"
aliases['la'] = "exa -a"
aliases['l'] = "exa -l"
aliases['ll'] = "exa -la"

aliases['find'] = "fd"
aliases['grep'] = "grep --color=auto"
aliases['egrep'] = "egrep --color=auto"
aliases['fgrep'] = "fgrep --color=auto"

aliases['xq'] = "xbps-query -R" # Show package details
aliases['xs'] = "xbps-query -Rs" # Search for package
aliases['xf'] = "xbps-query -f" # Show files from package
aliases['xx'] = "doas xbps-install" # Install package
aliases['xo'] = "doas xbps-remove -Oo" # Install package
aliases['xr'] = "doas xbps-remove -R" # Purge package
aliases['xu'] = "doas xbps-install -Su" # Full system upgrade
aliases['xa'] = "doas xbps-alternatives" # Alternatives
aliases['xm'] = "xbps-query -m | sed 's/-[0-9](.*)//' | sed 's/(.*) //'" # Manualy installed

aliases['svim'] = "doas nvim"

aliases['sv'] = "doas sv"
aliases['svl'] = "sv"
aliases['rsv'] = "doas vsv"
aliases['usv'] = "vsv -u"
