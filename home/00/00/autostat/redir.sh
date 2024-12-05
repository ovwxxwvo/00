#!/usr/bin/env bash


cd $( dirname $0 )
source ./basic.rc

SF_SH=".sh"
  SF_STA=".sta"
  SF_BAK=".bak"
  DT_FL="/tmp/block/"
  DT_FD="/proc/$$/fd/"
  DT_SRC="/home/00/status"
  NAMES=(` \
    echo -n $STATE_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $2}' \
    `)
  FDMJS=(` \
    echo -n $STATE_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $3}' \
    `)
  FDMNS=(` \
    echo -n $STATE_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $4}' \
    `)
  PT_FL_STA=(` \
    echo -n ${NAMES[@]} \
    | awk -v RS=" " \
    '{print "'"$DT_FL"'" $0 "'"$SF_STA"'" }' \
    `)
  PT_FL_BAK=(` \
    echo -n ${NAMES[@]} \
    | awk -v RS=" " \
    '{print "'"$DT_FL"'" $0 "'"$SF_BAK"'" }' \
    `)
  PT_FD_MJR=(` \
    echo -n ${FDMJS[@]} \
    | awk -v RS=" " \
    '{print "'"$DT_FD"'" $0 }' \
    `)
  PT_FD_MNR=(` \
    echo -n ${FDMNS[@]} \
    | awk -v RS=" " \
    '{print "'"$DT_FD"'" $0 }' \
    `)
  echo $STATE_LIST
  echo ${#NAMES[@]} ${NAMES[@]}
  echo ${#FDMJS[@]} ${FDMJS[@]}
  echo ${#FDMNS[@]} ${FDMNS[@]}
  echo ${#PT_FL_STA[@]} ${PT_FL_STA[@]}
  echo ${#PT_FL_BAK[@]} ${PT_FL_BAK[@]}
  echo ${#PT_FD_MJR[@]} ${PT_FD_MJR[@]}
  echo ${#PT_FD_MNR[@]} ${PT_FD_MNR[@]}
  MEM=$( free | grep 'Mem:' \
    | awk -F"[\t ]+" '{print $2}' )

mk_desc() {
  mkdir $DT_FL
  for i in ${!NAMES[@]}; do
    echo touch ${PT_FL_STA[i]}
    touch ${PT_FL_STA[i]}
    done
  # DT_FL_VM="$DT_FL$FL_VM"
    exec  100<> "${PT_FL_STA[0]}"
    exec  101<> "${PT_FL_STA[1]}"
    exec  102<> "${PT_FL_STA[2]}"
    exec  103<> "${PT_FL_STA[3]}"
    exec  105<> "${PT_FL_STA[4]}"
    exec  106<> "${PT_FL_STA[5]}"
    exec  117<> "${PT_FL_STA[6]}"
    exec  108<> "${PT_FL_STA[7]}"
    exec  109<> "${PT_FL_STA[8]}"
    exec  110<> "${PT_FL_STA[9]}"
    exec  111<> "${PT_FL_STA[10]}"
    exec  112<> "${PT_FL_STA[11]}"
    exec  113<> "${PT_FL_STA[12]}"
  for i in ${!NAMES[@]}; do
    echo rm ${PT_FL_STA[i]}
    rm ${PT_FL_STA[i]}
    done
  for i in ${!NAMES[@]}; do
    echo touch ${PT_FL_BAK[i]}
    touch ${PT_FL_BAK[i]}
    done
  # DT_FL_VM="$DT_FL$FL_VM"
    exec  200<> "${PT_FL_BAK[0]}"
    exec  201<> "${PT_FL_BAK[1]}"
    exec  202<> "${PT_FL_BAK[2]}"
    exec  203<> "${PT_FL_BAK[3]}"
    exec  205<> "${PT_FL_BAK[4]}"
    exec  206<> "${PT_FL_BAK[5]}"
    exec  217<> "${PT_FL_BAK[6]}"
    exec  208<> "${PT_FL_BAK[7]}"
    exec  209<> "${PT_FL_BAK[8]}"
    exec  210<> "${PT_FL_BAK[9]}"
    exec  211<> "${PT_FL_BAK[10]}"
    exec  212<> "${PT_FL_BAK[11]}"
    exec  213<> "${PT_FL_BAK[12]}"
  for i in ${!NAMES[@]}; do
    echo rm ${PT_FL_BAK[i]}
    rm ${PT_FL_BAK[i]}
    done
  rmdir $DT_FL
  echo $$
  }

rd_vmst() {
  nice vmstat 1 > ${PT_FD_MJR[0]} &
  while true; do
    nice vmstat > ${PT_FD_MJR[0]}
    sleep 60; done &
  while true; do
    vm=$( \
      cat -n ${PT_FD_MJR[0]} \
      | tr -d '\0' | tail -n 1 \
      | awk -F"[\t ]+" '{ print $6,$17 }' \
      )
    # echo $vm
    nice echo $vm \
      | awk -F"[\t ]+" \
      '{printf "USAGE=%02d\n", (100-$2)}' \
      > ${PT_FD_MJR[1]}
    nice echo $vm \
      | awk -F"[\t ]+" \
      '{printf "USAGE=%02d\n", (100-100*$1/"'"$MEM"'")}' \
      > ${PT_FD_MJR[2]}
  sleep $1; done &
  }

rd_fdmj() {
  while true; do
    for i in ${!NAMES[@]}; do
      nice echo ${NAMES[i]} |grep -E "vm|cpu|mem" > /dev/null
      if [ $? -eq 0 ]; then continue; fi
      nice echo ${NAMES[i]} |grep -E "$2" > /dev/null
      if [ $? -eq 1 ]; then continue; fi
      # echo "source $DT_SRC/${NAMES[i]}$SF_SH > ${PT_FD_MJR[i]}"
      nice bash -c ". $DT_SRC/${NAMES[i]}$SF_SH > ${PT_FD_MJR[i]}"
      done
  sleep $1; done &
  }

rd_fdmn() {
  while true; do
    vm=$( \
      cat -n ${PT_FD_MJR[0]} \
      | tr -d '\0' | tail -n 1 \
      | awk -F"[\t ]+" '{ print $6,$17 }' \
      )
    # echo $vm
    nice echo $vm \
      | awk -F"[\t ]+" \
      '{printf "USAGE=%02d\n", (100-$2)}' \
      > ${PT_FD_MNR[1]}
    nice echo $vm \
      | awk -F"[\t ]+" \
      '{printf "USAGE=%02d\n", (100-100*$1/"'"$MEM"'")}' \
      > ${PT_FD_MNR[2]}
    for i in ${!NAMES[@]}; do
      nice echo ${NAMES[i]} |grep -E "vm|cpu|mem" > /dev/null
      if [ $? -eq 0 ]; then continue; fi
      # echo "source $DT_SRC/${NAMES[i]}$SF_SH > ${PT_FD_MNR[i]}"
      nice bash -c ". $DT_SRC/${NAMES[i]}$SF_SH > ${PT_FD_MNR[i]}"
      done
  sleep $1; done &
  }

echo $$
  mk_desc
  rd_vmst  1
  rd_fdmj  2 "lock|power|led|vol|wlan|btth|udisk|vpn|share|samba"
  rd_fdmn 60
  # rd_fdmj  2 "wlan|btth|udisk"
  # rd_fdmj 10 "lock|led|vol|vpn|share|samba"
  # rd_fdmj 60 "power"
echo "<<<"
read -p ''


