#! /bin/sh -x
#
# xievd [INTERVAL]
#
# Poll `xinput` device list every INTERVAL seconds (default: 10)
# and run script in ~/.xievd/${device_name}.sh when a device is
# plugged-in (or pulled out).
#
# The device name is the same as given by `xinput --list`, with
# the following transformations applied:
#   * any non-alphanumeric character is deleted (except: space, `_` and `-`)
#   * leading and trailing spaces are removed
#   * any sequence of 1 or more space chars is converted to a single `_`
#

interval=${1:-10}

scripts_dir="$HOME/.xievd"
if [ ! -d "$scripts_dir" ]; then
  echo 1>&2 "xievd: No scripts directory -- exiting."
  exit 1
fi

state_dir="$(mktemp -t -d xievd.XXXXXX)" \
  || { echo 1>&2 "xievd: Cannot create state directory -- exiting."; exit 1; }
trap "rm -rf $state_dir; exit;" TERM QUIT INT ABRT

process_xinput_device_list() {
  touch "${state_dir}/.timestamp"

  # find new devices and run "start" script
  xinput --list --short \
    | fgrep slave \
    | sed -r -e 's/id=[0-9]+.+//;s/[^a-z0-9 _-]//ig;s/^ +//;s/ *$//;s/ +/_/g;' \
    | (while read device; do 
        if [ ! -e "${state_dir}/${device}" ]; then
          # new device, run plug-in script
          [ -x "${scripts_dir}/${device}" ] && "${scripts_dir}/${device}" start
        fi
        touch "${state_dir}/${device}"
      done)

  # find removed devices and run "stop" script
  for d in "$state_dir"/*; do
    if [ "${state_dir}/.timestamp" -nt "$d" ]; then
      # device removed, run "stop" script
      device="$(basename $d)"
      [ -x "${scripts_dir}/${device}" ] && "${scripts_dir}/${device}" stop
      rm -f "$d"
    fi
  done
}

# main loop
while true; do
      process_xinput_device_list
      sleep $interval
      sleep 1
done

# cleanup
rm -rf "$state_dir"





#export MOUSE_ID=`xinput list | grep -i "Logitech M510" | sed 's/^.*id=//;s/\t.*$//'`

#`xinput set-button-map $MOUSE_ID 1 2 3 4 5 8 9 7 6 10 11 12 13 14 15 16 17 18 19 20`
