#!/usr/bin/env bash


sleep 1
swaymsg focus output "DP-5"
firefox &

sleep 1
swaymsg focus output "DP-1"
alacritty -e tmux &


