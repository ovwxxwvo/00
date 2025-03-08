#!/usr/bin/env bash


entry=$(dirname "$0")
config="$entry""/config.sh"

source "$config"
appid="$cfg_class"


run_server() {
  server_dirt="/tmp/${appid}"
  server_file="${server_dirt}/ipc.fifo"
  [ ! -e "$server_dirt" ] && mkdir  "$server_dirt"
  [ ! -e "$server_file" ] && mkfifo "$server_file"

  tput civis
  tail --follow "$server_file"
  }


run_server


