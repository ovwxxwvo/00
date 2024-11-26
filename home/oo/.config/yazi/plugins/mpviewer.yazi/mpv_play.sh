#!/usr/bin/env bash


preview_file="${1}"
  med_w=''
  med_h=''

app_rect=''
  app_x="$2"
  app_y="$3"
  app_w="$4"
  app_h="$5"

win_rect=''
  cell_w=''
  cell_h=''
  tmux_pid=''
  term_pid=''

server='mpv'
  pane_tty=''
  server_dirt=''
  server_file=''
  window_title=''
  server_count=''

get_rect() {
  cell_w=$(tmux display-message -p '#{window_cell_width}')
  cell_h=$(tmux display-message -p '#{window_cell_height}')
  tmux_pid=$(tmux display-message -p '#{client_pid}')
  term_pid=$(ps -ef |grep -v "grep" |grep "$tmux_pid" |awk '{print $3}' )
  win_rect=$(swaymsg -r -t get_tree \
    |jq -j --arg pid "$term_pid" \
    '.. |select(.type?) |select(.pid|tostring==$pid).rect | "\(.x) \(.y) \(.width) \(.height)"' \
    )
  win_x=$(echo $win_rect |awk '{print $1}')
  win_y=$(echo $win_rect |awk '{print $2}')
  # win_x=$(echo "$win_x" |bc )
  # win_y=$(echo "$win_y" |bc )
  app_x=$(echo "($app_x+1.0)*$cell_w/1.2+$win_x" |bc)
  app_y=$(echo "($app_y+0.2)*$cell_h/1.2+$win_y" |bc)
  app_w=$(echo "$app_w*$cell_w" |bc)
  app_h=$(echo "$app_h*$cell_h" |bc)
  app_rect="$app_x $app_y $app_w $app_h"
    echo $tmux_pid
    echo $term_pid
    echo $win_rect
    echo $app_rect
    echo $win_x
    echo $win_y
    echo $app_x
    echo $app_y
    echo $app_w
    echo $app_h
    echo
  }

get_file() {
  pane_tty=$( tty |sed 's/\///g;s/dev//g' )
  server_dirt="/tmp/${server}-${pane_tty}"
  server_file="${server_dirt}/ipc.sock"
  window_title="${server}-${pane_tty}"
  server_count=$( ps -f |grep -v "grep" |grep -c "$server_file" )
  echo -en $pane_tty
  echo $server_dirt
  echo $server_file
  echo $window_title
  echo $server_count
  }

play_media() {
  x=$app_x
  y=$app_y
  w=$app_w
  h=$app_h
  # echo '{ "command": [ "", ""] }' |socat - "$server_file"
  # echo '{ "command": [ "playlist-next", "force"] }' |socat - "$server_file"
  echo '{ "command": [ "loadfile", "'"$preview_file"'" ] }' |socat - "$server_file"
  echo '{ "command": [ "set_property", "autofit", "'"$w"'" ] }' |socat - "$server_file"
  swaymsg  [title="$window_title"] move absolute position $x $y
  swaymsg  [title="$window_title"] move workspace current
  swaymsg  [pid="$term_pid"] focus

  # echo '{ "command": [ "set_property", "geometry", "'"$x:$y"'" ] }' |socat - "$server_file"
  # swaymsg  [title="$window_title"] resize set 40ppt 40ppt
  # swaymsg  [title="$window_title"] move position 800 100
  }

# get_rect
# get_file
# play_media
get_file   > /dev/null 2>&1
get_rect   > /dev/null 2>&1
play_media > /dev/null 2>&1 &


