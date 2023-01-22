#!/usr/bin/env bash

if [ "$(pidof pianobar)" ]
then
      /usr/local/bin/control-pianobar.sh p
  else
      /usr/bin/termite --title pianobar --exec '/usr/local/bin/control-pianobar.sh p' --hold
fi
