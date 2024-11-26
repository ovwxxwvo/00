#!/usr/bin/env bash


pane_tty=$( \
  tmux display-message -p '#{pane_tty}' \
  |sed 's/\///g;s/dev//g' \
  )
ueber_dirt='/tmp/ueberzug_'"$pane_tty"
ueber_fifo="$ueber_dirt"'/''ueberzug_fifo'

rmv_image() {
  [ ! -e $ueber_fifo ] && exit
  >"${ueber_fifo}" \
    declare -Ap remove_command=( \
      [action]="remove" \
      [identifier]="$pane_tty" \
      )
  }

rmv_image


