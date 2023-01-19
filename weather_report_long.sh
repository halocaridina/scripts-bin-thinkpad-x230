#!/usr/bin/bash

/usr/bin/weather-go --hide-icon | /usr/bin/sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | /usr/bin/rofi -dmenu -p "The current  is"
