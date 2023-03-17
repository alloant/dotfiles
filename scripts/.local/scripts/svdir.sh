#!/bin/sh

# User defined services `runsvdir`
SVDIR=$HOME/runit/service
if [ $(pgrep -f -c "^runsvdir ${SVDIR}") = 0 ]
then
exec runsvdir ${SVDIR} \
    "log: ..........................................."
else
    echo "Service is already running"
fi
