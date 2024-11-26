#!/usr/bin/env bash


swayidle -w \
  timeout  600  'swaylock -f -c 000000' \
  timeout 1800  'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
  before-sleep  'swaylock -f -c 000000'

wl-paste -t text --watch clipman store --no-persist


