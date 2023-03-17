#!/usr/bin/env sh

text=$(weather -m del)
t=$(echo "$text" | grep Temperature | awk '{print $2}')
w=$(echo "$text" | grep 'Sky conditions' | awk '{ $1=""; $2=""; print}' | xargs)
l1=$(echo "$text" | head -1 | tail -1)
l2=$(echo "$text" | head -2 | tail -1)
l3=$(echo "$text" | head -3 | tail -1)
l4=$(echo "$text" | head -4 | tail -1)
l5=$(echo "$text" | head -5 | tail -1)
l6=$(echo "$text" | head -6 | tail -1)
l7=$(echo "$text" | head -7 | tail -1)

newtext="$l1\n$l2\n$l3\n$l4\n$l5\n$l6\n$l7"
echo -E "{\"alt\":\"$w\",\"text\":\"$t\",\"tooltip\":\"$newtext\"}"
