#!/bin/bash

weather="$(curl -s 'wttr.in?format=3')"

if [[ $? != 0 ]]; then
    exit 1
fi

lat=$(echo $data | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['nearest_area'][0]['latitude'])")
lon=$(echo $data | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['nearest_area'][0]['longitude'])")

echo $lat > ~/.local/location
echo $lon >> ~/.local/location
