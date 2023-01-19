 #!/usr/bin/env bash

res=$(rofi -dmenu -lines 6 -columns 3 -u 2-5 -font "Roboto Mono for Powerline Regular 18" -p "What do you want to do? " -input < ~/.i3/rofi-i3exit.opts)

if [[ $res = "LOCK SCREEN" ]]; then
    xset dpms force off
fi
if [[ $res = "LOGOUT TO TTY CONSOLE" ]]; then
    /usr/bin/rm -f /tmp/screen_lock_toggled_off.lock /tmp/openconnect_vpn.lock /tmp/touchpad_toggled.* & /usr/bin/pkill bash & /usr/bin/i3-msg exit
fi
if [[ $res = "SUSPEND TO RAM" ]]; then
    systemctl suspend
fi
if [[ $res = "REBOOT" ]]; then
    systemctl reboot
fi
if [[ $res = "SHUTDOWN" ]]; then
    systemctl poweroff
fi
exit 0
