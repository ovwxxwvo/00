#!/usr/bin/env bash


appid="showkey"

set_win() {
  app=$(swaymsg -t get_tree |grep -c "\"app_id\": \"$appid\"")
  [ $app -eq 1 ] && swaymsg [app_id="$appid"] kill
  sleep 1
  # while true ;do
    # app=$(swaymsg -t get_tree |grep -c "\"app_id\": \"$appid\"")
    # [ $app -eq 1 ] && break
    # echo $app
    # sleep 0.5
    # done

  # swaymsg [app_id="$appid"] move workspace current
  swaymsg [app_id="$appid"] focus tiling

  }

exe_cmd() {
    #     
    # showmethekey-cli |awk -F"[\t {\":,]+" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14}'
  tput civis

  showmethekey-cli \
    |awk -F'[\t \"{:,_]+' \
    ' \
    { \
    if ($21=="PRESSED"){ print "--------------" } \
    if ($21=="PRESSED" ){ printf" %+8s   \n", $15 } \
    if ($21=="RELEASED"){ printf" %+8s   \n", $15 } \
    }'

  }


set_win
exe_cmd


