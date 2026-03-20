#!/usr/bin/env bash


OUTPUT_HDMI=$(swaymsg -t get_outputs |grep -i 'HDMI')
OUTPUT_DP=$(swaymsg -t get_outputs |grep -i 'DP')

if [ -n "$OUTPUT_HDMI" ]; then
  swaymsg workspace "1"
  sleep 1
  firefox &
  swaymsg workspace "2"
  sleep 1
  alacritty -e tmux &
elif [ -n "$OUTPUT_DP" ]; then
  workspace 5 output "DP-2"
  workspace 1 output "DP-1"
  sleep 1
  swaymsg focus output "DP-5"
  sleep 1
  firefox &
  swaymsg focus output "DP-1"
  sleep 1
  alacritty -e tmux &
fi

sleep 10
pulseaudio --kill


