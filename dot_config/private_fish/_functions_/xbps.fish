function xs -d "Search for package"
    xbps-query -Rs $argv
end

function xf -d "Show files from package"
    xbps-query -f $argv
end

function xx -d "Install package"
    doas xbps-install $argv
end

function xo -d "Install package"
    doas xbps-remove -Oo $argv
end

function xr -d "Purge package"
    doas xbps-remove -R $argv
end

function xu -d "Full system upgrade"
    doas xbps-install -Su $argv
end

function xa -d "Alternatives"
    doas xbps-alternatives $argv
end

function xm -d "Manually installed"
    xbps-query -m | sed 's/-[0-9]\(.*\)//' | sed 's/\(.*\) //' $argv
end

function xq -d "Show package details"
    xbps-query -R $argv
end

