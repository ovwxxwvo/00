#!/usr/bin/env bash


# # backlight
#   LED_BKLIT=$( xbacklight -get \
#     | awk -F"[\t =]+" \
#     '{ \
#     { printf "%02d", $0 } \
#     }' \
#     )
#
# # backlight
#   LED_EDP=$( xrandr | grep 'eDP' \
#     | awk -F"[\t ]+" '{print $2}'  \
#     | grep -c 'connected'
#     )
#   # echo $BACKLIGHT
#
# echo -e \
#   "\n LED_EDP=$LED_EDP"     \
#   "\n LED_BKLIT=$LED_BKLIT" \
#   ""
#

