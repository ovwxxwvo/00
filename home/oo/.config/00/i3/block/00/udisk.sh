#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='U'
  ENABLE=$U_ENABLE
  ACTIVE=$U_ACTIVE
  STATE=$U_STATE

function show_block {
  if [ $ENABLE -eq 1 ]; then
    BLOCK="$LABEL"
  else
    BLOCK=""
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if [ $ENABLE -eq 0 ]; then return; fi
  if   [ $ACTIVE -eq 1 ] && [ $STATE -eq 1 ]; then
    echo $COLOR_CCCC
  elif [ $ACTIVE -eq 1 ] && [ $STATE -eq 0 ]; then
    echo $COLOR_WHTE
  elif [ $ACTIVE -eq 0 ]; then
    echo $COLOR_GRLT
  fi
  }

show_block
show_color


