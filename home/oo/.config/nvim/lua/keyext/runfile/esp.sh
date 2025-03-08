#!/usr/bin/env bash


DIR=$( basename $PWD )
  PORT=$( \
    cat $1 | grep -i ' Esp file,' \
    | grep -Eo 'port=\S+' \
    | grep -Eo '/dev/\S+' \
    )
  RATE=$( \
    cat $1 | grep -i ' Esp file,' \
    | grep -Eo 'rate=\S+' \
    | grep -Eo '[0-9]+' \
    )

tmux splitw -h bash -c "
  echo $PWD/$1
  echo --------------------
  echo $DIR
  echo PORT $PORT
  echo RATE $RATE
  echo --------------------
  echo 'cat $1 > ./main/${DIR}_main.c'
  cat $1 > ./main/${DIR}_main.c
  echo --------------------
  echo 'idf export'
  source ~/esp/esp-at/esp-idf/export.sh
  echo --------------------
  echo 'idf build'
  idf.py fullclean
  idf.py build
  echo --------------------
  echo 'idf flash'
  sudo idf.py  -p ${PORT} flash
  sudo minicom -D ${PORT} -b ${RATE}
  echo --------------------
  read
  "

  # idf.py menuconfig


