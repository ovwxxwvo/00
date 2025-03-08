#!/usr/bin/env bash


ENABLE=$( rfkill |grep 'blue' \
  |grep -o 'unblocked' \
  |grep -c 'unblocked' \
  |grep -c '2' \
  )
POWER=$( bluetoothctl show \
  |grep -c 'Powered: yes' \
  )
# echo $ENABLE $POWER


function press_key {
  if   [ $POWER -eq 1 ]; then
    # sudo systemctl stop bluetooth
    bluetoothctl power off
  elif [ $POWER -eq 0 ]; then
    # sudo systemctl start bluetooth
    rfkill unblock bluetooth
    bluetoothctl power on
    sleep 0.2
    pactl set-sink-volume @DEFAULT_SINK@ 40%
  fi
  }

press_key


