#!/usr/bin/env bash


swayidle -w  \
  timeout  600  'swaylock -f -c 000000' \
  timeout 1800  'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
  before-sleep  'swaylock -f -c 000000' \
  &

# swaybg   -i  '/home/00/background/00.jpg'  &

# swaybar  -b  bar-0  &
# i3blocks -c "$HOME/.config/swaybar/i3blocks.conf"
# nice dash   "$HOME/.config/swaybar/serve.dsh"

# wl-paste -t text --watch clipman store --no-persist


