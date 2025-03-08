#!/usr/bin/env bash


PREFIX='monitor'
SUFFIX="$(date +%Y%m%d_%H%M%S)"
EXT='mp4'
# FILE_PATH='/home/download/screen/'"$PREFIX"'_'"$SUFFIX"'.'"$EXT"
FILE_PATH='/home/download/screen/'"$SUFFIX"'.'"$EXT"
# echo $FILE_PATH

ACTIVE=$( ps -ef \
  |grep -Ev "grep|man" \
  |grep -oc ' wf-recorder -a ' \
  )
echo srecd $ACTIVE


function press_key {
  if [ $ACTIVE -ne 1 ]; then
    wf-recorder \
    -a "$(pactl get-default-sink)" \
    -o "$(swaymsg -t get_outputs |jq -r '.[] | select(.focused) | .name')" \
    -f "$FILE_PATH" &
  else
    killall wf-recorder
    fi
  sleep 0.5
  }


press_key


