#!/bin/bash

weather="$(curl -s 'wttr.in?format=3')"
data=$(curl -s 'wttr.in?format=j2')

if [[ $? != 0 ]]; then
    exit 1
fi

lat=$(echo $data | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['nearest_area'][0]['latitude'])")
lon=$(echo $data | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['nearest_area'][0]['longitude'])")
max=$(echo $data | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['weather'][0]['maxtempC'])")
min=$(echo $data | python3 -c "import sys, json; data=json.load(sys.stdin); print(data['weather'][0]['mintempC'])")

echo $lat > ~/.local/location
echo $lon >> ~/.local/location

#wls=$(sv restart ~/runit/service/wlsunset)

IFS=':'; read -ra weather_array <<< "$weather"
text=$(echo ${weather_array[1]} | sed 's/C//g' | sed 's/\+//g')


tooltip="${weather_array[0]}\n<span size='xx-large'>$text</span>\nMax: $max˚ Min: $min˚"
#tooltip="<big>$text</big>\nMax: $max˚ Min: $min˚\n${weather_array[0]}"

#echo "{\"text\": \"$text\", \"tooltip\": \"${weather_array[0]}\"}"
echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\"}"
