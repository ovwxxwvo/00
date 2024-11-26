#!/usr/bin/env bash


if [ $(basename $0) = 'reget.sh' ]; then
  cd $( dirname $0 ); fi

. ./basic.rc
. ./common.rc

CONT=$( cat $FLMJ )
if [ "$CONT" != '' ];
  then . $FLMJ ;
  else . $FLMN ;
  fi
# echo $CONT


