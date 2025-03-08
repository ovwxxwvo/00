#!/usr/bin/env bash


PREFIX='window'
SUFFIX="$(date +%Y%m%d_%H%M%S)"
EXT='png'
# FILE_PATH='/home/download/screen/'"$PREFIX"'_'"$SUFFIX"'.'"$EXT"
FILE_PATH='/home/download/screen/'"$SUFFIX"'.'"$EXT"
# echo $FILE_PATH


function press_key {
  grim \
  -g "$(swaymsg -t get_tree |jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" \
  "$FILE_PATH" &
  sleep 0.5
  }


press_key


