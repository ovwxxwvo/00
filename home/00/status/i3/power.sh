#!/usr/bin/env bash


# # power
#   AC='AC0'
#   DC='BAT0'
#   DC_CAPACITY=$( \
#     cat /sys/class/power_supply/$DC/uevent \
#     | grep 'POWER_SUPPLY_CAPACITY=' \
#     | awk -F"[\t =]+" \
#     '{ \
#     { printf "%02d", $2 } \
#     }' \
#     )
#
# # power
#   AC_ONLINE=$( \
#     cat /sys/class/power_supply/$AC/uevent \
#     | grep 'POWER_SUPPLY_ONLINE=' \
#     | awk -F"[\t =]+" '{print $2}' \
#     )
#   DC_ONLINE=$( \
#     cat /sys/class/power_supply/$DC/uevent \
#     | grep 'POWER_SUPPLY_PRESENT=' \
#     | awk -F"[\t =]+" '{print $2}' \
#     )
#   # echo \#: $AC_ONLINE $DC_PRESENT $DC_CAPACITY
#
# echo -e \
#   "\n AC_ONLINE=$AC_ONLINE"     \
#   "\n DC_ONLINE=$DC_ONLINE"   \
#   "\n DC_CAPACITY=$DC_CAPACITY" \
#   ""
#

