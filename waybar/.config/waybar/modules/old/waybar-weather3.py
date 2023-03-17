#!/usr/bin/env python

import json
import weather

selections = weather.Selections()

argument = "del"
partial = weather.get_metar(
                uri=selections.get("metar", argument),
                verbose=False,
                quiet=False,
                headers=selections.get("headers", argument),
                imperial=False,
                metric=True,
                cache_data=(
                    selections.get_bool("cache") \
                        and selections.get_bool("cache_data")
                ),
                cacheage=selections.getint("cacheage"),
                cachedir=selections.get("cachedir")
                )

print(partial)
data = {}
