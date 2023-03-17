#!/bin/sh

#status="$(tail -1 /tmp/pcloud.log | awk '{print $NF}')"
status="$(tail -2 /tmp/pcloud.log | awk '/status is/{print $NF}')"

echo "{\"alt\":\"$status\",\"text\":\"\"}"

