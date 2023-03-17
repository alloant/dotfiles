#!/usr/bin/env python

import json
import weather

selections = weather.Selections()

argument = "del"
partial = weather.get_metar(
                uri=selections.get("metar", argument),
                metric=True,
                quiet=True,
                cache_data=(
                    selections.get_bool("cache") \
                        and selections.get_bool("cache_data")
                ),
                cacheage=selections.getint("cacheage"),
                cachedir=selections.get("cachedir")
                )

dt = partial.split("\n")
data = {}
sc = 'clear'
wt = ''
for d in dt:
    if 'Temperature' in d:
        data['text'] = d[13:-2]
    elif 'Weather' in d:
        wt = d[9:]
    elif 'Sky conditions' in d:
        sc = d[16:]


if sc != 'clear':
    data['alt'] = sc
else:
    data['alt'] = wt

data['tooltip'] = partial

print(json.dumps(data))
