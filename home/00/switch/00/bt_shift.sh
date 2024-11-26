#!/usr/bin/env bash
# switch config,
  # Copyright (C) 2021 Jessie Chan


# init var
  cd $( dirname $0 )
  source ../state/bluetooth.sh
  PATH=$BT_PATH
  MAC=$BT_MAC
  DEV=$BT_DEV
  MACS=(${BT_MACS[@]})
  DEVS=(${BT_DEVS[@]})
  # echo ${#DEVS[@]} ${DEVS[@]}
  # echo ${#MACS[@]} ${MACS[@]}

function press_key {
  for i in ${!DEVS[@]}
  do
  # echo ${DEVS[i]}
    if   [[ $i+1 -eq ${#DEVS[@]} ]]; then
      i=0
      MAC=${MACS[i]}
      DEV=${DEVS[i]}
      echo mac="$MAC" >  $PATH
      echo dev="$DEV" >> $PATH
      break
    elif [[ $DEV ==  ${DEVS[i]} ]]; then
      i=$i+1
      MAC=${MACS[i]}
      DEV=${DEVS[i]}
      echo mac="$MAC" >  $PATH
      echo dev="$DEV" >> $PATH
      break
    fi
  done
}


press_key


