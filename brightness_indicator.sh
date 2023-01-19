#!/bin/env sh

usage="usage: $0 -c {up|down} -i [increment]"
command=
increment=5

while getopts i:h o
do case "$o" in
    i) increment=$OPTARG;;
    h) echo "$usage"; exit 0;;
    ?) echo "$usage"; exit 0;;
esac
done

shift $(($OPTIND - 1))
command=$1

if [ "$command" = "" ]; then
    echo "usage: $0 {up|down} [increment]"
    exit 0;
fi

display_brightness=0

if [ "$command" = "up" ]; then
    display_brightness=$(light -A $increment && light -G | awk -F"." '{print $1}')
    icon_name="/usr/share/icons/gnome-colors-common/scalable/notifications/notification-display-brightness-high.svg"
fi

if [ "$command" = "down" ]; then
    display_brightness=$(light -U $increment && light -G | awk -F"." '{print $1}')
    icon_name="/usr/share/icons/gnome-colors-common/scalable/notifications/notification-display-brightness-high.svg"
fi

##/usr/local/bin/notify-send.sh " " -i $icon_name -h int:value:$display_brightness -h string:synchronous:brightness --expire-time=10000 --replace-file=/tmp/brightness_notification

/usr/local/bin/notify-send.sh -i $icon_name --hint=int:transient:1 "Brightness is at $display_brightness%" --expire-time=3000 --replace-file=/tmp/brightness_notification

