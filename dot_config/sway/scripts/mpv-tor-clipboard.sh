#!/bin/sh

mpv --script=/usr/lib/mpv-mpris/mpris.so --ytdl-raw-options="proxy=[socks5://127.0.0.1:9050],format=bestvideo[height<=?360]+bestaudio/best" $(wl-paste)
