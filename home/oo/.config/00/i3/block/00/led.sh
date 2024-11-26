#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='L:'

function show_block {
  if [ $LED_EDP -eq 1 ]; then
    BLOCK=$LABEL$LED_BKLIT
  else
    BLOCK=''
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if [ $LED_BKLIT -gt 85 ]; then
    echo $COLOR_PPPP
  else
    echo $COLOR_WHTE
  fi
  }

show_block
show_color


