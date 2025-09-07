#!/usr/bin/env bash


function press_key {
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  }

press_key


