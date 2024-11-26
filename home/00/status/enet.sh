#!/usr/bin/env bash


# enet
  # EN_DEV='enp2s0'
  EN_DEV=$( ip link \
    | grep -Eo ': en\w+:' \
    | grep -Eo '\w+' \
    )
  # echo $EN_DEV

# enet
  EN_ENABLE=$( ip link | grep $EN_DEV \
    | grep -Eo 'NO-CARRIER' \
    | grep -c 'NO-CARRIER' \
    | grep -c '0'
    )
  EN_POWER=$( ip link | grep $EN_DEV \
    | grep -Eo 'UP>' \
    | grep -Eo '\w+' \
    | grep -c 'UP' \
    )
  EN_STATE=$( ip link | grep $EN_DEV \
    | grep -Eo 'state \w+ ' \
    | grep -Eo '[A-Z]+' \
    | grep -c 'UP' \
    )
  # echo WL $EN_ENABLE $EN_POWER $EN_STATE

echo -e \
  "\n EN_ENABLE=$EN_ENABLE "   \
  "\n EN_POWER=$EN_POWER "     \
  "\n EN_STATE=$EN_STATE "     \
  ""


