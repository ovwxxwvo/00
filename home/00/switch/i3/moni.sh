#!/usr/bin/env bash


cd $( dirname $0 )
source ../status/$( basename $0 )
  FILE=$MONI_FILE
  DPI='Xft.dpi:'
  # echo $FILE
  DEF=$MONI_DEF
  DEVS=(` echo ${MONI_DEVS[@]} `)
  MODES=(` echo ${MONI_MODES[@]} `)
  RATES=(` echo ${MONI_RATES[@]} `)
  ONLYONE=$MONI_ONLYONE
  SAMEA2INTER=$MONI_SAMEA2INTER
  INTER2EXTER=$MONI_INTER2EXTER
  EXTER2TOTAL=$MONI_EXTER2TOTAL
  TOTAL2SAMEA=$MONI_TOTAL2SAMEA
  SAMEA2TOTAL=$MONI_SAMEA2TOTAL
  SINGL2TOTAL=$MONI_SINGL2TOTAL
  echo ----------------------
  echo ${#DEVS[@]} ${DEVS[@]}
  echo ${#MODES[@]} ${MODES[@]}
  echo ${#RATES[@]} ${RATES[@]}
  # echo $ONLYONE
  echo ----------------------
  echo 'SAMEA2INTER' $SAMEA2INTER
  echo 'INTER2EXTER' $INTER2EXTER
  echo 'EXTER2TOTAL' $EXTER2TOTAL
  echo 'TOTAL2SAMEA' $TOTAL2SAMEA
  echo 'SAMEA2TOTAL' $SAMEA2TOTAL
  echo 'SINGL2TOTAL' $SINGL2TOTAL
  echo ----------------------

function press_key {
# set monitor
    # for i in ${!DEVS[@]}; do
    #   xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]} --rotate normal
    #   done
  # return if only one monitor
  if   [ $ONLYONE -eq 1 ]; then
    echo 'only one monitor'
    xrandr --output ${DEVS[0]} --scale 1 --mode ${MODES[0]} --rate ${RATES[0]}
  # output monitor sameas   to internal
  elif [ $SAMEA2INTER -eq 1 ]; then
    echo 'output internal monitor'
    for i in ${!DEVS[@]}; do
      if [ $i -eq 0 ]
      then echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]}
      else echo $i of
        xrandr --output ${DEVS[$i]} --off
      fi
      done
  # output monitor internal to external
  elif [ $INTER2EXTER -eq 1 ]; then
    echo 'output external monitor'
    for i in ${!DEVS[@]}; do
      if [ $i -eq 0 ]
      then echo $i of
        xrandr --output ${DEVS[$i]} --off
      else echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]} --right-of ${DEVS[i-1]}
      fi
      done
  # output monitor external to total
  elif [ $EXTER2TOTAL -eq 1 ]; then
    echo 'output total monitor'
    for i in ${!DEVS[@]}; do
      if [ $i -eq 0 ]
      then echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]}
      else echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]}  --right-of ${DEVS[i-1]}
      fi
      done
  # output monitor toatl    to sameas
  elif [ $TOTAL2SAMEA -eq 1 ]; then
    echo 'output same monitor'
    for i in ${!DEVS[@]}; do
      if [ $i -eq 0 ]
      then echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]}
      else echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]} --same-as ${DEVS[0]}
      fi
      done
  # output monitor sameas   to total
  elif [ $SAMEA2TOTAL -eq 1 ]; then
    echo 'output total monitor'
    for i in ${!DEVS[@]}; do
      if [ $i -eq 0 ]
      then echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]}
      else echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]} --right-of ${DEVS[i-1]}
      fi
      done
  elif [ $SINGL2TOTAL -eq 1 ]; then
    echo 'output total monitor'
    for i in ${!DEVS[@]}; do
      if [ $i -eq 0 ]
      then echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]}
      else echo $i on
        xrandr --output ${DEVS[$i]} --scale 1 --mode ${MODES[$i]} --rate ${RATES[$i]} --right-of ${DEVS[i-1]}
      fi
      done
  fi
# set dpi
  WIDTHS=$( \
    xrandr | grep -A 1 ' connected' \
    | grep -v ' connected' \
    | grep '*' \
    | awk -F"[\t x]+" '{print $2}' \
    )
  # echo $WIDTHS
  if   [[ $WIDTHS =~ '2560' ]]; then
    echo $DPI 180 > $FILE
  elif [[ $WIDTHS =~ '1920' ]]; then
    echo $DPI 140 > $FILE
  fi
  xrdb -merge $FILE
}

press_key


