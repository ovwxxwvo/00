#!/usr/bin/env bash


ACTIVE=$( ps -ef \
  |grep -v 'grep' \
  |grep -oc ' ollama serve$' \
  )
echo ol $ACTIVE


function press_key {
  if [ $ACTIVE -ne 1 ]; then
    ollama serve &
  else
    killall ollama
  fi
  sleep 1
  }

press_key


