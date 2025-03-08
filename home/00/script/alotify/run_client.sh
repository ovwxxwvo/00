#!/usr/bin/env bash


entry=$(dirname "$0")
config="$entry""/config.sh"

source "$config"
appid="$cfg_class"
msg="$1"


run_clinet() {
  server_dirt="/tmp/${appid}"
  server_file="${server_dirt}/ipc.fifo"

  echo ''         > ${server_file}
  echo -ne "$msg" > ${server_file}
  echo -ne "\r"   > ${server_file}
  swaymsg [app_id="$appid"] move workspace current

  sleep 2
  echo ''         > ${server_file}
  echo -ne ''     > ${server_file}
  echo -ne "\r"   > ${server_file}
  swaymsg [app_id="$appid"] move scratchpad

  }


run_clinet


