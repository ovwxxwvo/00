#!/usr/bin/env bash


function press_key {
  pactl set-sink-volume @DEFAULT_SINK@ +5%
  }

press_key


