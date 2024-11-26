#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='BT' # 󰂯
  ENABLE=$BT_ENABLE
  POWER=$BT_POWER
  PAIR=$BT_PAIR
  CONN=$BT_CONN

function show_block {
  if [ $ENABLE -eq 1 ]; then
    BLOCK=$LABEL
  else
    BLOCK=""
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if   [ $POWER -eq 1 ]; then
    if    [ $PAIR -eq 1 ] && [ $CONN -eq 1 ]; then
      echo $COLOR_AAAA
    elif  [ $PAIR -eq 1 ] && [ $CONN -eq 0 ]; then
      echo $COLOR_WHTE
    elif  [ $PAIR -eq 0 ] && [ $CONN -eq 1 ]; then
      echo $COLOR_RRRR
    elif  [ $PAIR -eq 0 ] && [ $CONN -eq 0 ]; then
      echo $COLOR_VVVV
    fi
  elif [ $POWER -eq 0 ]; then
    echo $COLOR_GRLT
  fi
  }

show_block
show_color


