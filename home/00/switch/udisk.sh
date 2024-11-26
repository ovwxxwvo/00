#!/usr/bin/env bash


cd $( dirname $0 )
source ../status/$( basename $0 )
  ROOT=$U_ROOT
  PREFIX=$U_PREFIX
  ENABLE=$U_ENABLE
  ACTIVE=$U_ACTIVE
  STATE=$U_STATE
  DISKS=( ${U_DISKS[@]} )
  PARTS=( ${U_PARTS[@]} )
  LABELS=( ${U_LABELS[@]} )
  LETTERS=( ${U_LETTERS[@]} )
  PREFIXS=( ${U_PREFIXS[@]} )
  MNTS=( ${U_MNTS[@]} )

function press_key {
  if [ $ENABLE -eq 0 ]; then return; fi
    # sleep 1
  if   [ $ACTIVE -eq 1 ] && [ $STATE -eq 1 ]; then
    for i in ${!PARTS[@]}; do
      echo sudo rmdir "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      sudo umount "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      sudo rmdir  "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      done
  elif [ $ACTIVE -eq 1 ] && [ $STATE -eq 0 ]; then
    for i in ${!LABELS[@]}; do
      count=$(echo ${MNTS[@]} | grep -c "${LABELS[i]}")
      if [ $count -eq 0 ]; then
        # echo $count
        echo sudo mkdir "$ROOT/${PREFIXS[i]}${LABELS[i]}"
        sudo mkdir "$ROOT/${PREFIXS[i]}${LABELS[i]}"
        sudo mount -o uid=1000,gid=100 \
          "/dev/${PARTS[i]}" "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      fi
      done
  elif [ $ACTIVE -eq 0 ]; then
    for i in ${!PARTS[@]}; do
      echo sudo mkdir "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      sudo mkdir "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      sudo mount -o uid=1000,gid=100 \
        "/dev/${PARTS[i]}" "$ROOT/${PREFIXS[i]}${LABELS[i]}"
      done
  fi
  }

press_key

cd ../autostat
source ./reset.sh


