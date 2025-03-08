#!/usr/bin/env bash


function press_key {

  cd /home/config

  /home/config/sync_etc.sh
  /home/config/sync_home.sh
  # /home/config/sync_root.sh

  sway reload
  tmux source ~/.config/tmux/tmux.conf

  }


press_key


