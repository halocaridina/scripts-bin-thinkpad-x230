#!/usr/bin/env bash

touch /tmp/pre

/usr/bin/compton --config /home/srsantos/.config/compton/compton.conf &>/dev/null &

touch /tmp/post

exit 0
