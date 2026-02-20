alias exa "exa --color=auto --group-directories-first"
alias ls "exa"
alias la "exa -a"
alias l "exa -l"
alias l. "exa -ad .*"
alias ll "exa -la"

alias find "fd"

alias grep "grep --color=auto"
alias egrep "egrep --color=auto"
alias fgrep "fgrep --color=auto"

# I use these mainly for auto complete as it doesn't work with tuxc, etc
alias xq "xbps-query -R" # Show package details
alias xs "xbps-query -Rs" # Search for package
alias xf "xbps-query -f" # Show files from package
alias xx "doas xbps-install" # Install package
alias xo "doas xbps-remove -Oo" # Install package
alias xr "doas xbps-remove -R" # Purge package
alias xu "doas xbps-install -Su" # Full system upgrade
alias xa "doas xbps-alternatives" # Alternatives
alias xm "xbps-query -m | sed 's/-[0-9]\(.*\)//' | sed 's/\(.*\) //'" # Manualy installed

# Nvim for toor
alias svim "doas nvim"
#alias v "$EDITOR"
#alias vv "doas env HOME=$HOME LANG=$LANG $EDITOR" # Preserve enviornment for editor configuration

# Make sv and reboot and poweroff for user
alias sv "doas sv"
alias svl "sv"
alias rsv "doas vsv"
alias usv "vsv -u"
alias reboot "doas reboot"
alias poweroff "doas poweroff"

# Apply PREFIX to cmake
alias cmake "cmake -DCMAKE_INSTALL_PREFIX=$PREFIX"

# For xdeb
alias xdeb "xdeb -Sedf"
alias xideb "xbps-install -R ./binpkgs"

# No more YouTube to MP3 sites...
alias yta "yt-dlp --extract-audio --audio-quality 0"
alias dl "aria2c"

# System app configuration
alias df "df -h"
alias lc "wc -l"
alias mpv "mpv --script=/usr/lib/mpv-mpris/mpris.so"
alias fid "grep -Irn" # Recursively find a pattern in a directory (eg. fid stdio someprojectdir)
alias pt "pstree -aps"
alias pk "pkill"
alias mosh "mosh --no-ssh-pty"

# Tor options
alias mpv-tor "mpv '--ytdl-raw-options=proxy=[socks5://127.0.0.1:9050]'"
alias tannie 'HTTPS_PROXY="socks5://127.0.0.1:9050" lux'
alias curl-tor "curl -x 'socks5://127.0.0.1:9050' -C -"
alias mega-tor "megadl --proxy=socks5://127.0.0.1:9050"
alias youtor "yt-dlp --proxy socks5://127.0.0.1:9050"

# Complex commands
alias xfree_cardumen_Ind "xfreerdp -f +clipboard /u:Aes-Ind /drive:home,/home/antonio/Personal/cr/Transfer /v:10.0.0.10"
alias xfree_cardumen_Aso "xfreerdp -f +clipboard /u:Aes-Aso /drive:home,/home/antonio/Personal/cr/Transfer /v:10.0.0.10"
alias xfree_harvest "xfreerdp -f +clipboard /u:bt203 /v:172.16.176.12"
