#!/usr/bin/env bash


cmd=$1
opa=$2
wrap="$HOME/.config/sway/wrap"


alacritty \
  --class   "$cmd" \
  --title   "$cmd" \
  --option  "window.opacity=$opa" \
  --command "$wrap/$cmd.sh"


