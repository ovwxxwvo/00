#!/usr/bin/env bash


if [ $(basename $0) = 'reset.sh' ]; then
  cd $( dirname $0 ); fi

. ./basic.rc
. ./common.rc

. ../status/$(basename $0) > $FLMN
. ../status/$(basename $0) > $FLMJ
# tmux display "$0 -- $? $FLMJ-$FLMN-"


