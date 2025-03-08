#!/usr/bin/env bash


ACTIVE=$( ps -ef \
  |grep -v 'grep' \
  |grep -oc ' clash$' \
  )
echo CL $ACTIVE


function press_key {
  if [ $ACTIVE -ne 1 ]; then
    eval " \
    export  http_proxy=http://127.0.0.1:7890  ; \
    export  https_proxy=http://127.0.0.1:7890 ; \
    clash \
    " &
  else
    killall clash
  fi
  sleep 0.5
  }

press_key


