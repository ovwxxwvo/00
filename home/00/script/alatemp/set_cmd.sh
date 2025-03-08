#!/usr/bin/env bash


devs=()

get_temp() {
  IFS=''
  devs=()
  while read -r line; do
    # echo $line
    devs+=("$line")
  done < <( sensors \
    |grep -Ei "amd|k10|spd|nvme|mt|temp|composite|tctl|edge" \
    |grep -EiA1 "amd|k10|spd|nvme|mt" \
    |awk -F"[ \t]+" ' BEGIN{IGNORECASE=1} \
      /k10/  { printf "01 | cpu %-20s ", $0 ;getline; print $2 } \
      /gpu/  { printf "02 | gpu %-20s ", $0 ;getline; print $2 } \
      /spd/  { printf "03 | mem %-20s ", $0 ;getline; print $2 } \
      /nvme/ { printf "04 | hdd %-20s ", $0 ;getline; print $2 } \
      /mt/   { printf "05 | wan %-20s ", $0 ;getline; print $2 } \
      ' \
    |sort |awk -F"|" '{print $2 }' \
    |awk -F" " '{print " "$1":",$3" " }' \
    )
  # echo
  }

show_temp() {
  tput civis
  for i in "${devs[@]}" ;do
    echo
    echo -n $i
    done
  for i in "${devs[@]}" ;do
    echo -ne "\033[A\r"
    done
  }

# echo ${devs[@]}
while : ;do
  get_temp
  show_temp
  sleep 1
  done


