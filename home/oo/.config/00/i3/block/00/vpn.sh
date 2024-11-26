#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='VN'
  ACTIVE=$VN_ACTIVE
  PROXY=$VN_PROXY
  CLASH=$VN_CLASH

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
    if   [ $CLASH -eq 1 ]; then
      echo $COLOR_LLLL
    elif [ $CLASH -eq 0 ] && [ $PROXY -eq 1 ]; then
      echo $COLOR_WHTE
    elif [ $CLASH -eq 0 ] && [ $PROXY -eq 0 ]; then
      echo $COLOR_GRLT
    fi
  fi
  }

show_block
show_color


