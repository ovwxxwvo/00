#!/usr/bin/env bash


ACTIVE=$( systemctl status smb nmb \
  | grep -o 'active (running)' \
  | grep -c 'active (running)' \
  | grep -c '2'
  )
# echo SH $ACTIVE


function press_key {
  if [ $ACTIVE -eq 1 ]; then
    sudo systemctl stop smb nmb
  else
    sudo systemctl start smb nmb
  fi
  }

press_key


