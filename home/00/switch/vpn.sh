#!/usr/bin/env bash


cd $( dirname $0 )
source ../status/$( basename $0 )
  ACTIVE=$VN_ACTIVE
  PROXY=$VN_PROXY
  CLASH=$VN_CLASH
  PROFILE=$VN_PROFILE
  EXPORT=( ${VN_EXPORT[@]} )

function press_key {
  if   [ $PROXY -eq 1 ]; then
    if   [ $ACTIVE -eq 1 ] && [ $CLASH -eq 1 ]; then
      killall clash  &  echo '' > $PROFILE
    elif [ $ACTIVE -eq 1 ] && [ $CLASH -eq 0 ]; then
      clash &
    elif [ $ACTIVE -eq 0 ]; then
      for i in ${EXPORT[@]}; do echo "$i" >> $VN_PROFILE; done
    fi
  elif [ $PROXY -eq 0 ]; then
    if [ $ACTIVE -eq 1 ]; then
      echo '' > $PROFILE
    else
      for i in ${EXPORT[@]}; do echo "$i" >> $VN_PROFILE; done
      eval " ${EXPORT[0]} ; ${EXPORT[1]} ; clash & "
      # echo " ${EXPORT[0]} ; ${EXPORT[1]} ; clash & "
    fi
  fi
  }

press_key

cd ../autostat
source ./reset.sh


