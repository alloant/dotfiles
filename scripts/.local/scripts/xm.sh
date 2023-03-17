#!/usr/bin/sh

xbps-query -m | sed 's/-[0-9]\(.*\)//' | sed 's/\(.*\) //'
