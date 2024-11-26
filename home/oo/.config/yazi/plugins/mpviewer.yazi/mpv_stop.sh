#!/usr/bin/env bash


server='mpv'
  pane_tty=''
  server_dirt=''
  server_file=''
  window_title=''
  server_count=''

get_file() {
  pane_tty=$( tty |sed 's/\///g;s/dev//g' )
  server_dirt="/tmp/${server}-${pane_tty}"
  server_file="${server_dirt}/ipc.sock"
  window_title="${server}-${pane_tty}"
  echo $pane_tty
  echo $server_dirt
  echo $server_file
  echo $window_title
  echo $server_count
  }

stop_media() {
  swaymsg  [title="$window_title"] move scratchpad
  echo '{ "command" : ["set_property","pause",true] }' |socat - "$server_file"
  # echo '{ "command": [ "playlist-next", "force"] }' |socat - "$server_file"
  # echo '{ "command": [ "", ""] }' |socat - "$server_file"
  }

server_count=$( ps -f |grep -v "grep" |grep -c "$server_file" )
[ $server_count -eq 0 ] && exit
# get_file
# stop_media
get_file   > /dev/null 2>&1
stop_media > /dev/null 2>&1 &


