#!/usr/bin/env bash


function press_key {
  xbacklight -inc 5
  }

press_key

cd $( dirname $0 )
./led.sh


