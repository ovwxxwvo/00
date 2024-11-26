#!/usr/bin/env bash


# lock
  LK_CAP=$( xset -q \
    | grep -Eo 'Caps Lock:[ ]+[a-z]{2}' \
    | awk -F": " '{print $2}' \
    | grep -c 'on'
    )
  LK_NUM=$( xset -q \
    | grep -Eo 'Num Lock:[ ]+[a-z]{2}' \
    | awk -F": " '{print $2}' \
    | grep -c 'on'
    )
  # echo $LK_CAP $LK_NUM

echo -e \
  "\n LK_CAP=$LK_CAP " \
  "\n LK_NUM=$LK_NUM " \
  ""


