#!/usr/bin/env bash


sudo ip link set wlp3s0 down &
sudo bluetoothctl power off  &

# xbacklight -set 80
pactl set-sink-volume @DEFAULT_SINK@ 40%

# libinput-gestures-setup start
numlockx


