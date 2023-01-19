#!/usr/bin/env bash

/usr/bin/sleep 0.5

/usr/bin/xcalib -d :0 /home/srsantos/.color/icc/ThinkPad_X240_FHD_LP125WF2.icm

/usr/bin/systemd-cat -t "xcalib_screen" /usr/bin/echo "***** LAPTOP MONITOR COLOR CALIBRATED ON $(date) *****"
