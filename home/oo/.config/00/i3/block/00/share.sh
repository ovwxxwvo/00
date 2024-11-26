#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='SH'
  ACTIVE=$SH_ACTIVE

function show_block {
  if [ $ACTIVE -eq 1 ]; then
    BLOCK="$LABEL"
  else
    BLOCK=""
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if [ $ACTIVE -eq 1 ]; then
    echo $COLOR_YYYY
  fi
  }

show_block
show_color


