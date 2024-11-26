#!/usr/bin/env bash


# mem
   MEM_USAGE=$( top -bn 1 \
    | grep 'Mem :' \
    | awk -F"[\t :,]+" '{print $3,$7}' \
    | awk '{ printf "%04.1f", ($2/$1*100) }' \
    )
  # echo MEM $MEM_USAGE


