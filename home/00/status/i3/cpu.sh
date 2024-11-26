#!/usr/bin/env bash


# cpu
  CPU_USAGE=$( top -bn 1 \
    | grep 'Cpu(s):' \
    | awk -F"[\t :,]+" '{print $8}' \
    | awk '{ printf "%04.1f", (100-$0) }' \
    )
  # echo CPU $CPU_USAGE


