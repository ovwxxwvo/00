#!/usr/bin/env bash


# volume
  SINK=$( pactl get-default-sink )
  VOL_RT=$( pactl get-sink-volume $SINK \
    | grep -Eoe 'right:.+%' \
    | awk -F"[\t :%]+" \
    '{ \
    { printf "%02d", $4 } \
    }' \
    )
  VOL_LT=$( pactl get-sink-volume $SINK \
    | grep -Eoe 'left:.+%' \
    | awk -F"[\t :%]+" \
    '{ \
    { printf "%02d", $4 } \
    }' \
    )
  VOLUME=$VOL_RT
  # echo V: $SINK $MUTE $BALANCE $VOLUME $VOLUME_L $VOLUME_R

# volume
  VOL_MUTE=$( pactl get-sink-mute $SINK \
    | awk -F"[\t :]+" '{print $2}'  \
    | grep -c 'yes' \
    )
  VOL_BLNC=$( pactl get-sink-volume $SINK \
    | grep -Eoe 'balance.+' \
    | awk -F"[\t :]+" '{print $2}' \
    | grep -c '0.00' \
    )
  # echo V: $SINK $MUTE $BALANCE $VOLUME $VOLUME_L $VOLUME_R

echo -e \
  "\n VOL_MUTE=$VOL_MUTE" \
  "\n VOL_BLNC=$VOL_BLNC" \
  "\n VOL_LT=$VOL_LT" \
  "\n VOL_RT=$VOL_RT" \
  "\n VOLUME=$VOLUME" \
  ""


