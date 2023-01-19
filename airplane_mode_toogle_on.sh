#!/usr/bin/env bash

TOGGLE="/tmp/airplane_mode_toggled_on.lock"

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE && echo "1" > /tmp/airplane_mode_toggled_on.lock
    /usr/bin/sudo /usr/bin/rfkill block all
    notify-send 'Airplane Mode On' -i /usr/share/icons/gnome/scalable/status/airplane-mode-symbolic.svg
else
    rm -f $TOGGLE
    /usr/bin/sudo /usr/bin/rfkill unblock all
    notify-send 'Airplane Mode Off' -i /usr/share/icons/gnome/scalable/status/airplane-mode-symbolic.svg
fi

