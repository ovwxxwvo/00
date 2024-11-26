#!/usr/bin/env bash


dirt_src="$HOME/.config/yazi/config"
dirt_dst="$HOME/.config/yazi/plugins/config"

if ! test -d "$dirt_src"; then
  # echo $dirt_src
  exit
  fi

if ! test -d "$dirt_dst"; then
  # echo $dirt_dst
  mkdir "$dirt_dst"
  fi

link_file() {
  file_prefixs=$( ls "$dirt_src" \
    |grep 'lua' \
    |sed 's/.lua$//' \
    )
    # echo $file_prefixs

  # echo '---------- ---------- ---------- ----------'
  for n in ${file_prefixs[@]} ;do
    f_src="$dirt_src/$n.lua"
    d_dst="$dirt_dst/$n.yazi"
    f_dst="$dirt_dst/$n.yazi/init.lua"
    # echo $n
    # echo $f_src
    # echo $d_dst
    # echo $f_dst

  if ! test -d "$d_dst"; then
    echo mkdir "$d_dst"
    mkdir "$dirt_dst/$n.yazi"
    fi

  if ! test -e "$f_dst"; then
    echo ln -s "$f_src" "$f_dst"
    ln -s "$f_src" "$f_dst"
    fi

  done
  }

link_file


