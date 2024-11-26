#!/usr/bin/env bash


LABEL='¦'
  RX_DATA=''
  TX_DATA=''
  RX_SPEED=''
  TX_SPEED=''
  RX_DATA_TEMP=0
  RX_DATA_PREV=0
  RX_DATA_NEXT=0
  TX_DATA_TEMP=0
  TX_DATA_PREV=0
  TX_DATA_NEXT=0

function set_data {
  INTERFACE=$( ip addr | grep 'inet ' \
    | grep -Eo 'global dynamic .+' \
    | grep -Eo '[a-z,0-9]+$' \
    )
  # echo $INTERFACE
  if [[ "$INTERFACE" == '' ]]; then
    INTERFACE=''
    RX_SPEED=''
    TX_SPEED=''
    return; fi
  echo $BLOCK
  }

function get_data {
  RX_DATA=$( cat /proc/net/dev | grep "$INTERFACE" \
    | awk -F"[\t ]+" '{print $2}' )
  TX_DATA=$( cat /proc/net/dev | grep "$INTERFACE" \
    | awk -F"[\t ]+" '{print $10}' )
  }

function show_block {
  # data ( before & after ) a second
  RX_DATA_PREV=$RX_DATA_TEMP  # old
  RX_DATA_NEXT=$RX_DATA       # new
  RX_DATA_TEMP=$RX_DATA       # new
  # speed ( K | M ) per second
  RX_SPEED=$(($RX_DATA_NEXT-$RX_DATA_PREV))
  if   [[ $RX_SPEED -lt 1000 ]]; then
    RX_SPEED=$( echo $RX_SPEED | \
      awk '{printf "%03dB/s", $1}' )
  elif [[ $RX_SPEED -lt 1024000 ]]; then
    RX_SPEED=$( echo $RX_SPEED | \
      awk '{printf "%03dK/s", $1/1024}' )
  elif [[ $RX_SPEED -lt 1048576000 ]]; then
    RX_SPEED=$( echo $RX_SPEED | \
      awk '{printf "%.1fM/s", $1/1048576}' )
  else
    RX_SPEED=$( echo $RX_SPEED | \
      awk '{printf "%d", $1}' )
  fi
  # data ( before & after ) a second
  TX_DATA_PREV=$TX_DATA_TEMP  # old
  TX_DATA_NEXT=$TX_DATA       # new
  TX_DATA_TEMP=$TX_DATA       # new
  # speed ( K | M ) per second
  TX_SPEED=$(($TX_DATA_NEXT-$TX_DATA_PREV))
  if   [[ $TX_SPEED -lt 1000 ]]; then
    TX_SPEED=$( echo $TX_SPEED | \
      awk '{printf "%03dB/s", $1}' )
  elif [[ $TX_SPEED -lt 1024000 ]]; then
    TX_SPEED=$( echo $TX_SPEED | \
      awk '{printf "%03dK/s", $1/1024}' )
  elif [[ $TX_SPEED -lt 1048576000 ]]; then
    TX_SPEED=$( echo $TX_SPEED | \
      awk '{printf "%.1fM/s", $1/1048576}' )
  else
    TX_SPEED=$( echo $TX_SPEED | \
      awk '{printf "%d", $1}' )
  fi
  # block show after sleep
  BLOCK="$RX_SPEED$LABEL$TX_SPEED"
  echo $BLOCK
  sleep 1
  }

set_data
while true; do
get_data
show_block
done


