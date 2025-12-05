function yta --description "Extract audio YouTube"
    yt-dlp --extract-audio --audio-quality 0
end

function dl --description ""
    aria2c
end

function mpv --description ""
    mpv --script=/usr/lib/mpv-mpris/mpris.so
end

function mpv-tor --description ""
    mpv '--ytdl-raw-options=proxy=[socks5://127.0.0.1:9050]'
end

function tannie --description ""
    HTTPS_PROXY="socks5://127.0.0.1:9050" lux
end

function curl-tor --description ""
    curl -x 'socks5://127.0.0.1:9050' -C -
end

function mega-tor --description ""
    megadl --proxy=socks5://127.0.0.1:9050
end

function youtor --description ""
    yt-dlp --proxy socks5://127.0.0.1:9050
end

function mosh --description ""
    mosh --no-ssh-pty
end
