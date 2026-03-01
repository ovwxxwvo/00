#!/usr/bin/env bash


pulseaudio --kill &

OUTPUT_HDMI=$(swaymsg -t get_outputs |grep -i 'HDMI')
OUTPUT_DP=$(swaymsg -t get_outputs |grep -i 'DP')

if [ -n "$OUTPUT_HDMI" ]; then
  sleep 1
  swaymsg workspace "1"
  firefox &
  sleep 1
  swaymsg workspace "2"
  alacritty -e tmux &
elif [ -n "$OUTPUT_DP" ]; then
  sleep 1
  swaymsg focus output "DP-5"
  firefox &
  sleep 1
  swaymsg focus output "DP-1"
  alacritty -e tmux &
fi



