#!/usr/bin/env bash


ACTIVE=$( ps -ef \
  |grep -v 'grep' \
  |grep -oc ' showmethekey-cli ' \
  )
echo showkey $ACTIVE


function press_key {
#     
  if [ $ACTIVE -ne 1 ]; then
    # showmethekey-cli |awk -F"[\t {\":,]+" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14}'
    cmd='showmethekey-cli |grep -o "key"'
    # eval $cmd
    alacritty -e bash -c $cmd
      # showmethekey-cli \
      # |awk -F'[\t \"{:,_]+' \
      # '{ \
      # if ($21=="PRESSED" ){ printf"%-12s  \n", $15 } \
      # if ($21=="RELEASED"){ printf"%-12s  \n", $15 } \
      # }'
    sleep 1
    # swaymsg [title="showmethekey-cli"] move workspace current
  else
    killall showmethekey-cli
  fi
  sleep 1
  }


press_key


