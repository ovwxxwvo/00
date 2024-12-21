#!/usr/bin/env bash


PREFIX='region'
SUFFIX="$(date +%Y%m%d_%H%M%S)"
EXT='png'
# FILE_PATH='/home/download/screen/'"$PREFIX"'_'"$SUFFIX"'.'"$EXT"
FILE_PATH='/home/download/screen/'"$SUFFIX"'.'"$EXT"
# echo $FILE_PATH


function press_key {
  grim \
  -g "$(slurp)" \
  "$FILE_PATH" &
  }


press_key


