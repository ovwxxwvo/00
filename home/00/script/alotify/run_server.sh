#!/usr/bin/env bash


entry=$(dirname "$0")
config="$entry""/config.sh"
set_ala="$entry""/set_ala.sh"
set_cmd="$entry""/set_cmd.sh"
set_win="$entry""/set_win.sh"


echo ==================== server =============
echo $entry
echo $config
echo $set_ala
echo $set_cmd
echo $set_win


source "$config"
source "$set_ala"
source "$set_win"


