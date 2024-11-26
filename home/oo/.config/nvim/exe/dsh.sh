#!/usr/bin/env bash


tmux splitw -h bash -c "
  echo $PWD/$1
  echo --------------------
  dash $1
  echo --------------------
  read REPLY
  "


