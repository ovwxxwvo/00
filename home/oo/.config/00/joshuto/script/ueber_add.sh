#!/usr/bin/env bash


file_path=${1} # Full path of the previewed file
  x="$2"       # x coordinate of upper left cell of preview area
  y="$3"       # y coordinate of upper left cell of preview area
  w="$4"       # Width of the preview pane  (number of fitting characters)
  h="$5"       # Height of the preview pane (number of fitting characters)
pane_tty=$( \
  tmux display-message -p '#{pane_tty}' \
  |sed 's/\///g;s/dev//g' \
  )
ueber_count=$( ps -e \
  |grep "$( echo $pane_tty |sed 's/.\{3\}/&\//' )" \
  |grep -c 'ueber' \
  )
ueber_dirt='/tmp/ueberzug_'"$pane_tty"
ueber_fifo="$ueber_dirt"'/''ueberzug_fifo'
  # echo $pane_tty $ueber_count $ueber_fifo
  # read -p ''
  # tmux display-message  "$pane_tty $ueber_fifo"
  # tmux display-message  "$pane_tty $FILE_PATH"
  # tmux display-message  "$pane_tty $x $y $w $h"

check_init() {
  [ ! -e $ueber_fifo ] && exit
  [ $ueber_count -eq 0 ] && exit
  }

add_image() {
  [ $( echo $file_path |grep -c ' ' ) -gt 0 ] && return
    cw=$( tmux display-message -p '#{window_cell_width}'  )
    ch=$( tmux display-message -p '#{window_cell_height}' )
    fw=$( \
      exiftool $file_path \
      |grep -Ei '^[[:space:]]*Image Width' \
      |grep -Eo '[0-9]*' \
      )
    fh=$( \
      exiftool $file_path \
      |grep -Ei '^[[:space:]]*Image Height' \
      |grep -Eo '[0-9]*' \
      )
    ww=$( echo "$w*$cw" |bc )
    hh=$( echo "$h*$ch" |bc )

  if   [ $fw -le $ww ] && [ $fh -le $hh ] ;then
    w=$( echo "$fw/$cw" |bc )
    h=$( echo "$fh/$ch" |bc )
  elif [ $fw -gt $fh ] ;then
    w=$( echo "$w-1"              |bc )
    h=$( echo "($ww*$fh/$fw)/$ch" |bc )
  elif [ $fh -gt $fw ] ;then
    h=$( echo "$h-1"              |bc )
    w=$( echo "($hh*$fw/$fh)/$cw" |bc )
  elif [ $fw -eq $fh ] ;then
    w=$( echo "$w-2" |bc )
    h=$( echo "$h-1" |bc )
  fi
  # tmux display-message "$id $w $h $ww $hh $fw $fh"

  >"${ueber_fifo}" \
    declare -Ap add_command=( \
      [action]="add" \
      [identifier]="$pane_tty" \
      [path]="${file_path}" \
      [x]="$x" \
      [y]="$y" \
      [width]="$w" \
      [height]="$h" \
      [scaling_position_x]=0.5 \
      [scaling_position_y]=0.5 \
      [scaler]=forced_cover \
      )

  }

rmv_image() {
  >"${ueber_fifo}" \
    declare -Ap remove_command=( \
      [action]="remove" \
      [identifier]="$pane_tty" \
      )
  }

add_text() {
  exiftool $file_path
  }

extension=$(echo $file_path |grep -Eo "[a-zA-Z0-9]*$")
  # mimetype=$(file --mime-type -Lb "$file_path")
  # extension=$(echo "${file_path##*.}" | awk '{print tolower($0)}')
  # tmux display-message  "$pane_tty $mimetype $extension"

case "$extension" in
  jpg | png )
    # add_text
    check_init
    rmv_image
    add_image
    exit 0
    ;;
  *)
    check_init
    rmv_image
    exit
    ;;
esac


