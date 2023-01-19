#!/usr/bin/env sh

DEVICE=`ls -1 /sys/bus/hid/drivers/razermouse | head -1`

/usr/local/bin/set_orochi_dpi.py --device ${DEVICE} --dpi_x 1300 --dpi_y 1300 &>/dev/null &

/usr/bin/systemd-cat -t "razer_orochi_dpi" /usr/bin/echo "***** RAZER OROCHI SET TO 1300 DPI - $(date) *****"

exit 0

