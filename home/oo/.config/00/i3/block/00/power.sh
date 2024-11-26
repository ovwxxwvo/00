#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL=':'
  LABEL_AC=''
  LABEL_DC='󱊣'

function show_block {
  if [ $AC_ONLINE -eq 1 ] && [ $DC_ONLINE -eq 1 ]; then
    BLOCK=$LABEL_AC$LABEL_DC$LABEL$DC_CAPACITY
  elif [ $AC_ONLINE -eq 1 ]; then
    BLOCK=$LABEL_AC$LABEL$DC_CAPACITY
  elif [ $DC_ONLINE -eq 1 ] ;then
    BLOCK=$LABEL_DC$LABEL$DC_CAPACITY
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if [ $DC_CAPACITY -eq 100 ]; then
    echo $COLOR_WHTE
  elif [ $DC_CAPACITY -le 100 ]; then
    echo $COLOR_GGGG
  elif [ $DC_CAPACITY -le 80  ]; then
    echo $COLOR_LLLL
  elif [ $DC_CAPACITY -le 60  ]; then
    echo $COLOR_YYYY
  elif [ $DC_CAPACITY -le 40  ]; then
    echo $COLOR_OOOO
  elif [ $DC_CAPACITY -le 20  ]; then
    echo $COLOR_RRRR
  fi
  }

show_block
# show_color


