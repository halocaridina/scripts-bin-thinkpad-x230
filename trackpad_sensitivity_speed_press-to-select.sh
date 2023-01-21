#!/usr/bin/env bash

/usr/bin/echo -n "225" > /sys/devices/platform/i8042/serio1/serio2/sensitivity
/usr/bin/echo -n "25" > /sys/devices/platform/i8042/serio1/serio2/drift_time
/usr/bin/echo -n "120" > /sys/devices/platform/i8042/serio1/serio2/speed
/usr/bin/echo -n "200" > /sys/devices/platform/i8042/serio1/serio2/rate

#/usr/bin/echo -n "120" > /sys/devices/platform/i8042/serio1/serio2/sensitivity
#/usr/bin/echo -n "25" > /sys/devices/platform/i8042/serio1/serio2/drift_time

#/usr/bin/echo -n "1" > /sys/devices/platform/i8042/serio1/serio2/press_to_select
#/usr/bin/echo -n "90" > /sys/devices/platform/i8042/serio1/serio2/speed
#/usr/bin/echo -n "200" > /sys/devices/platform/i8042/serio1/serio2/rate
#/usr/bin/echo -n "6" > /sys/devices/platform/i8042/serio1/serio2/inertia

/usr/bin/systemd-cat -t "Trackpoint" /usr/bin/echo "***** MODIFYING TRACKPOINT ATTRIBUTES ON $(date) *****"
