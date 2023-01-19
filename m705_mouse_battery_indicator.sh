#!/usr/bin/env bash

# PATH FOR LOGITECH M705
NAME="`cat /sys/class/power_supply/hidpp_battery_3/model_name`"
CAPACITY="`cat /sys/class/power_supply/hidpp_battery_3/capacity`"

/usr/bin/notify-send -i /usr/share/icons/gnome/256x256/devices/input-mouse.png "Logitech ${NAME}" "Batteries are at ${CAPACITY}%"
