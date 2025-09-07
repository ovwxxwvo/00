#!/usr/bin/env bash


function press_key {
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  }

press_key


