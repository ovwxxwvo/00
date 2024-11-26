#!/usr/bin/env bash
# I3 config, keymap
  # Copyright (C) 2021 Jessie Chan
  #
  # This program is free software: you can redistribute it
  # and/or modify it under the terms of the GNU General Public License
  # as published by the Free Software Foundation,
  # either version 3 of the License, or any later version.
  #
  # You should have received a copy of the GNU General Public License
  # along with this program.
  # If not, see <http://www.gnu.org/licenses/>.


# init var
  cd $( dirname $0 )
  source ./00.sh
  source ../00/color.sh
  source ../state/bluetooth.sh

  LABEL='BT'
  DEV=$BT_DEV

function show_block {
  BLOCK="$LABEL : $DEV"
  echo $BLOCK
  sleep 5
  BLOCK=""
  echo $BLOCK
}


show_block


