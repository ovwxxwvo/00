#!/usr/bin/env bash


cd $( dirname $0 )
source ./status.rc

LABEL='¦' # ¦
  LABEL_CAP='A'
  LABEL_NUM='N'
  CAP=$LK_CAP
  NUM=$LK_NUM

function show_block {
  if  [ $CAP -eq 0 ] && [ $NUM -eq 0 ] ; then
    BLOCK=$LABEL
  elif [ $CAP -eq 1 ]; then
    BLOCK=$LABEL_CAP
  elif [ $NUM -eq 1 ]; then
    BLOCK=$LABEL_NUM
  fi
  echo $BLOCK
  echo $BLOCK
  }

function show_color {
  if  [ $CAP -eq 0 ] && [ $NUM -eq 0 ] ; then
    echo $COLOR_YYYY
  elif [ $CAP -eq 1 ]; then
    echo $COLOR_RRRR
  elif [ $NUM -eq 1 ]; then
    echo $COLOR_CCCC
  fi
  }

show_block
show_color


