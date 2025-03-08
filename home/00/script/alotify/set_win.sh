#!/usr/bin/env bash


title="$cfg_title"
appid="$cfg_class"
x="$cfg_x"
y="$cfg_y"
w="$cfg_w"
h="$cfg_h"


get_rect(){
  echo ==================== rect ===============
  rect=$( swaymsg -t get_outputs |jq -r \
    ' .[] |select(.focused) |.rect |"\(.width) \(.height)" ' \
    )
  moni_w=$( echo "$rect" |awk '{print $1}' )
  moni_h=$( echo "$rect" |awk '{print $2}' )
  echo $rect
  echo $moni_w
  echo $moni_h

  x=$( echo "${moni_w}*${x}/100" |bc )
  y=$( echo "${moni_h}*${y}/100" |bc )
  w=$( echo "${moni_w}*${w}/100" |bc )
  h=$( echo "${moni_h}*${h}/100" |bc )
  echo $x
  echo $y
  echo $w
  echo $h
  }

set_win() {
  echo ==================== win ================
  echo $title
  echo $appid

  app=$(swaymsg -t get_tree |grep -c "\"app_id\": \"$appid\"")
  [ $app -eq 1 ] && swaymsg [app_id="$appid"] kill
  sleep 1

  swaymsg [app_id="$appid"] floating enable
  swaymsg [app_id="$appid"] resize set    $w $h
  swaymsg [app_id="$appid"] move position $x $y
  swaymsg [app_id="$appid"] border none
  swaymsg [app_id="$appid"] sticky enable
  swaymsg [app_id="$appid"] move workspace current
  swaymsg focus tiling
  }


get_rect
set_win


