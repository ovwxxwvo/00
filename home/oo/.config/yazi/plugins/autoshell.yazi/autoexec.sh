#!/usr/bin/env bash


# echo ----------
  # echo $PWD
  # echo $0
  # echo ----------

dirt="$HOME/.config/yazi/scripts"

if test -d "$dirt"; then
  # echo $dirt
  # ls $dirt
	for sh in $dirt/*.sh; do
    # echo $sh
		# test -x "$sh" && . "$sh"
		test -x "$sh" && "$sh"
	done
  fi


