#!/usr/bin/env bash


ENABLE=$( rfkill |grep 'blue' \
  |grep -o 'unblocked' \
  |grep -c 'unblocked' \
  |grep -c '2' \
  )
STATE=$( cat /proc/net/wireless \
  |grep -c '0000' \
  )
# echo $ENABLE $STATE


function press_key {
  if   [ $STATE -eq 1 ]; then
    # sudo systemctl stop bluetooth
    bluetoothctl disconnect $MAC
    bluetoothctl power off
  elif [ $STATE -eq 0 ]; then
    # sudo systemctl start bluetooth
    bluetoothctl power on
    bluetoothctl connect $MAC
    sleep 0.5
    pactl set-sink-volume @DEFAULT_SINK@ 40%
  fi
  }

press_key


