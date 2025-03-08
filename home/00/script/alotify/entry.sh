#!/usr/bin/env bash


entry=$(dirname "$0")
config="$entry""/config.sh"
server="$entry""/run_server.sh"
client="$entry""/run_client.sh"


echo ==================== entry ==============
echo $entry


opt="$1"
msg="$1"


if [ "$opt" == '--server' ]
  then
    "$server"
  else
    "$client" "$msg"
  fi


