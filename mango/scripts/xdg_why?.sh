#!/bin/bash

eval $(dbus-launch --sh-syntax)
export XDG_SESSION_ID=$(echo $$)
