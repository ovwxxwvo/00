#!/usr/bin/env bash


ACTIVE=$( ps -ef \
  |grep -v 'grep' \
  |grep -oc ' ollama serve$' \
  )
echo OL $ACTIVE


function press_key {
  if [ $ACTIVE -ne 1 ]; then
    HSA_OVERRIDE_GFX_VERSION="11.0.2" \
    ollama serve &
  else
    killall ollama
  fi
  sleep 0.5
  }

press_key


