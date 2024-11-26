#!/usr/bin/env bash


# share
  SH_ACTIVE=$( systemctl status smb nmb \
    | grep -o 'active (running)' \
    | grep -c 'active (running)' \
    | grep -c '2'
    )
  # echo SH $SH_ACTIVE

echo -e \
  "\n SH_ACTIVE=$SH_ACTIVE" \
  ""


