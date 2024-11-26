#!/usr/bin/env bash


cd $( dirname $0 )
  source ./status.rc
  source $( basename $0 )

LABEL='MEM'
  USAGE=$MEM_USAGE

function show_block {
  BLOCK="$LABEL:$USAGE%"
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if   [ ${USAGE%.*} -gt 80 ]; then
    echo $COLOR_RRRR
  elif [ ${USAGE%.*} -gt 60 ]; then
    echo $COLOR_OOOO
  elif [ ${USAGE%.*} -gt 40 ]; then
    echo $COLOR_YYYY
  elif [ ${USAGE%.*} -gt 20 ]; then
    echo $COLOR_LLLL
  else
    echo $COLOR_WHTE
  fi
#
  # if   [[ `echo "$USAGE>80"|bc` -eq 1 ]]; then
  #   echo $COLOR_RRRR
  # elif [[ `echo "$USAGE>60"|bc` -eq 1 ]]; then
  #   echo $COLOR_OOOO
  # elif [[ `echo "$USAGE>40"|bc` -eq 1 ]]; then
  #   echo $COLOR_YYYY
  # elif [[ `echo "$USAGE>20"|bc` -eq 1 ]]; then
  #   echo $COLOR_LLLL
  # else
  #   echo $COLOR_WHTE
  # fi
}

show_block
show_color


