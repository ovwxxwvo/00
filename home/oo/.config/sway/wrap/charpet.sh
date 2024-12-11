#!/usr/bin/env bash


appid="charpet"

set_win() {
  swaymsg [app_id="$appid"] kill
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
  tput civis

  while true ;do
    echo ===== =====
    sleep 1
    done

  }


set_win
exe_cmd


