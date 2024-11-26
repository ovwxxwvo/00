#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='V:'
LABEL_MUTE='M'

function show_block {
  if [ $VOL_MUTE -eq 1 ]; then
    BLOCK=$LABEL$LABEL_MUTE
  elif [ $VOL_BLNC -eq 1 ]; then
    BLOCK=$LABEL$VOLUME
  elif [ $VOL_BLNC -eq 0 ]; then
    BLOCK=$LABEL$VOL_LT-$VOL_RT
  else
    BLOCK=''
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if [ $VOL_MUTE -eq 1 ]; then
    echo $COLOR_GRLT
  elif [ $VOLUME -gt 100 ]; then
    echo $COLOR_RRRR
  else
    echo $COLOR_WHTE
  fi
  }

show_block
show_color


