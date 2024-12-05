#!/usr/bin/env bash


PREFIX='monitor'
SUFFIX="$(date +%Y%m%d_%H%M%S)"
EXT='png'
# FILE_PATH='/home/download/screen/'"$PREFIX"'_'"$SUFFIX"'.'"$EXT"
FILE_PATH='/home/download/screen/'"$SUFFIX"'.'"$EXT"
# echo $FILE_PATH


function press_key {
  grim \
  -o "$(swaymsg -t get_outputs |jq -r '.[] | select(.focused) | .name')" \
  "$FILE_PATH" &
  }


press_key


