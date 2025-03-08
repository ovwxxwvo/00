#!/usr/bin/env bash


DEV=$( cat /proc/net/dev \
  |grep -Eo "^wl[0-9a-z]+" \
  )
ENABLE=$( rfkill |grep 'wlan' \
  |grep -o 'unblocked' \
  |grep -c 'unblocked' \
  |grep -c '2' \
  )
POWER=$( cat /proc/net/wireless \
  |grep -c '0000' \
  )
# echo $DEV $ENABLE $POWER


function press_key {
  if   [ $POWER -eq 1 ]; then
    # sudo systemctl stop NetworkManager
    sudo ip link set $DEV down
  elif [ $POWER -eq 0 ]; then
    # sudo systemctl start NetworkManager
    rfkill unblock wifi
    sudo ip link set $DEV up
  fi
  }


press_key


