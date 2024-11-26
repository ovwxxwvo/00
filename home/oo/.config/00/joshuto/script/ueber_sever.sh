#!/usr/bin/env bash


# set var
  pane_tty=''
  pane_pid=''
  tail_pid=''
  ueber_pid=''
  ueber_dirt=''
  ueber_fifo=''
  # tv_ue_path_dirt='@ueberzug_path_dirt_'
  # tv_ue_path_fifo='@ueberzug_path_fifo_'
  # tv_jo_turn_ueber='@joshuto_turn_ueber_'

start_ueberzug() {
  # mk dirt & fifo
  pane_tty=$( tty |sed 's/\///g;s/dev//g' )
  # ueber_dirt='/tmp/ueberzug_XXXX'
  # [ ! -e $ueber_dirt ] && ueber_dirt=$(mktemp -d "$ueber_dirt")
  ueber_dirt='/tmp/ueberzug_'"$pane_tty"
  [ ! -e $ueber_dirt ] && mkdir "$ueber_dirt"
  ueber_fifo="$ueber_dirt"'/''ueberzug_fifo'
  [ ! -e $ueber_fifo ] && mkfifo "$ueber_fifo"
  echo $pane_tty $ueber_fifo
  echo
  echo 'mk dirt & fifo ...'
  echo
  # set tmux var
    # tmux set  -gq "${tv_ue_path_dirt}${pane_tty}" ${ueber_dirt}
    # tmux set  -gq "${tv_ue_path_fifo}${pane_tty}" ${ueber_fifo}
    # tmux show -g  "${tv_ue_path_fifo}${pane_tty}"
    # tmux show -gv "${tv_ue_path_fifo}${pane_tty}"
  # start ueberzug
  tail --follow "$ueber_fifo" \
    |ueberzug layer --silent --parser bash &
  echo
  echo "ueberzug start ..."
  echo
  }

stop_ueberzug() {
  # remove dirt & fifo
  pane_tty=$( tty |sed 's/\///g;s/dev//g' )
  ueber_dirt='/tmp/ueberzug_'"$pane_tty"
  ueber_fifo="$ueber_dirt"'/''ueberzug_fifo'
    # ueber_dirt=$( tmux show -gv "${tv_ue_path_dirt}${pane_tty}" )
    # ueber_fifo=$( tmux show -gv "${tv_ue_path_fifo}${pane_tty}" )
  echo $pane_tty $ueber_fifo
  rm     "$ueber_fifo"
  rm -rf "$ueber_dirt"
  echo
  echo 'rm dirt & fifo ...'
  echo
  # stop ueberzug
  tail_pid=$(  ps |grep 'tail'  |grep -Eo "^[[:space:]]*[0-9]+" )
  ueber_pid=$( ps |grep 'ueber' |grep -Eo "^[[:space:]]*[0-9]+" )
  echo $tail_pid $ueber_pid
  kill "$tail_pid"
  kill "$ueber_pid"
  echo
  echo "ueberzug stop ..."
  echo
  }


echo '========== =========='
ueber_count=$( ps |grep -c 'ueber' )
if   [ $ueber_count -eq 0 ] ;then
  # trap stop_ueberzug  EXIT QUIT INT TERM
  start_ueberzug
elif [ $ueber_count -eq 1 ] ;then
  stop_ueberzug
else
  killall ueberzug
  echo 'ueberzug already started ...'
  echo 'killall ueberzug ...'
  echo
fi

echo '========== =========='
exit $?


