#!/usr/bin/env bash


DEV=$( cat /proc/net/dev \
  |grep -Eo "^wl[0-9a-z]+" \
  )
ENABLE=$( rfkill |grep 'wlan' \
  |grep -o 'unblocked' \
  |grep -c 'unblocked' \
  |grep -c '2' \
  )
STATE=$( cat /proc/net/wireless \
  |grep -c '0000' \
  )
# echo $DEV $ENABLE $STATE


function press_key {
  if   [ $STATE -eq 1 ]; then
    sudo ip link set $DEV down
    # sudo systemctl stop NetworkManager
    # sudo systemctl stop dhcpcd
  elif [ $STATE -eq 0 ]; then
    sudo ip link set $DEV up
    # sudo systemctl start NetworkManager
    # sudo systemctl start dhcpcd
    # nmcli dev wifi list
    # nmcli dev wifi connect '' password ''
  fi
  }


press_key


