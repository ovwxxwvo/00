#!/usr/bin/env bash


tmux splitw -h bash -c "
  echo $PWD/$1
  echo --------------------
  python $1
  echo --------------------
  read
  "


