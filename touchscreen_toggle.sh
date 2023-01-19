#!/usr/bin/env bash

export XAUTHORITY=/home/srsantos/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

declare -i ID
ID=`/usr/bin/xinput list | /usr/bin/grep -Eio 'touchscreen\s*id\=[0-9]{1,2}' | /usr/bin/grep -Eo '[0-9]{1,2}'`
declare -i STATE
STATE=`/usr/bin/xinput list-props $ID | /usr/bin/grep 'Device Enabled' | /usr/bin/awk '{print $4}'`

if [ $STATE -eq 1 ]
then
    /usr/bin/rm -f /tmp/touchscreen_toggled.*
    /usr/bin/xinput enable $ID
    /usr/bin/touch /tmp/touchscreen_toggled.pid && /usr/bin/echo "1" > /tmp/touchscreen_toggled.lock
    /usr/bin/chown srsantos:srsantos /tmp/touchscreen_toggled.*
    /usr/bin/xinput disable $ID
    /usr/bin/notify-send -i /usr/share/icons/touchscreen/touch_icon_white.png 'Touchscreen' 'Disabled' --expire-time=4000
else
    /usr/bin/rm -f /tmp/touchscreen_toggled.*
    /usr/bin/xinput enable $ID
    /usr/bin/notify-send -i /usr/share/icons/touchscreen/touch_icon_white.png 'Touchscreen' 'Enabled' --expire-time=4000
fi

