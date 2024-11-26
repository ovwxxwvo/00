#!/usr/bin/env bash


# wlan
  # WL_DEV='wlp3s0'
  WL_DEV=$( ip link \
    | grep -Eo ': wl\w+:' \
    | grep -Eo '\w+' \
    )
  # echo $WL_DEV

# wlan
  WL_SSID=$( iw $WL_DEV link | grep 'SSID' \
    | awk -F"[\t :]+" '{print $3}' )
  WL_QUALITY=$( iw $WL_DEV link | grep 'signal' \
    | awk -F"[\t :]+" '{print $3}' )
  # echo WL $WL_ENABLE $WL_POWER $WL_STATE $WL_SSID $WL_QUALITY

# wlan
  WL_ENABLE=$( rfkill | grep 'wlan' \
    | grep -Eo 'unblocked$' \
    | grep -c 'unblocked' \
    )
  WL_POWER=$( ip link | grep $WL_DEV \
    | grep -Eo ',UP' \
    | grep -Eo '\w+' \
    | grep -c 'UP' \
    )
  WL_STATE=$( ip link | grep $WL_DEV \
    | grep -Eo 'state \w+ ' \
    | grep -Eo '[A-Z]+' \
    | grep -c 'UP' \
    )
  # echo WL $WL_ENABLE $WL_POWER $WL_STATE $WL_SSID $WL_QUALITY

echo -e \
  "\n WL_ENABLE=$WL_ENABLE "   \
  "\n WL_POWER=$WL_POWER "     \
  "\n WL_STATE=$WL_STATE "     \
  "\n WL_QUALITY=$WL_QUALITY " \
  ""


