#!/usr/bin/env bash


# set var
  server='mpv'
  pane_tty=''
  server_dirt=''
  server_file=''
  window_title=''
  server_count=''
  preview_file="/home/config/home/oo/.config/yazi/plugins/mpserver.yazi/init.png"

get_file() {
  pane_tty=$( tty |sed 's/\///g;s/dev//g' )
  server_dirt="/tmp/${server}-${pane_tty}"
  server_file="${server_dirt}/ipc.sock"
  window_title="${server}-${pane_tty}"
  server_count=$( ps -f |grep -v "grep" |grep -c "$server_file" )
  echo $pane_tty
  echo $server_dirt
  echo $server_file
  echo $window_title
  echo $server_count
  echo
  }

start_server() {
  # mk dirt & fifo
  [ ! -e $server_dirt ] && mkdir "$server_dirt"
  [ ! -e $server_file ] && mkfifo "$server_file"
  # sleep 1
  echo 'mk dirt & fifo ...'
  # start server
  mpv --no-config \
    --input-ipc-server="$server_file" \
    --title="$window_title" \
    --idle=yes \
    --keep-open=yes \
    --focus-on=never \
    --loop-playlist=inf \
    --image-display-duration=inf \
    --osc=no \
    --input-default-bindings=no \
    --input-vo-keyboard=no \
    --input-media-keys=no \
    --input-builtin-bindings=no \
    --input-builtin-dragging=no \
    --input-cursor-passthrough=yes \
    --input-terminal=no \
    --terminal=no \
    "$preview_file" &
  echo " server start ..."
  }

stop_server() {
  # stop server
  echo '{ "command":["quit"] }' |socat - "$server_file"
  echo " server stop ..."
  # sleep 1
  # remove dirt & fifo
  rm     "$server_file"
  rm -rf "$server_dirt"
  echo 'rm dirt & fifo ...'
  }

# get_file
get_file     > /dev/null 2>&1
if   [ $server_count -eq 0 ] ;then
  # start_server
  start_server > /dev/null 2>&1
  echo " server start ..."
elif [ $server_count -eq 1 ] ;then
  # stop_server
  stop_server  > /dev/null 2>&1
  echo " server stop ..."
else
  echo 'many server already started ...'
  # killall "$server"
  # echo 'killall server ...'
fi

