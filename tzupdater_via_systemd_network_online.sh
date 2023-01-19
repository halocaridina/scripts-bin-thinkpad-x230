#!/usr/bin/env sh

/usr/bin/tzupdate
/usr/bin/systemd-cat -t "tzupdater_via_systemd" /usr/bin/echo "***** UPDATED TIMEZONE VIA SYSTEMD NETWORK ONLINE - $(date) *****"
exit 0
