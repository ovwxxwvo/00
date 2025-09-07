#!/usr/bin/env dash


SERVE_DIRT='/tmp/swaybar_block'


make_file() {
  [ ! -e "$SERVE_DIRT" ] && mkdir -p "$SERVE_DIRT"

  if [ -e "$SERVE_DIRT" ] ;then
    sudo mount -t tmpfs tmpfs "$SERVE_DIRT" \
      -o 'user,nosuid,nodev,noexec,noatime,size=200k' \
      --onlyonce
  else
    exit
    fi

  }


make_file


