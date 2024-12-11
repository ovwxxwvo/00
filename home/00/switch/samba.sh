#!/usr/bin/env bash


ROOT='/mnt'
SM_LIST=('
  HW-00   | oo | 1234567890 | 1.0
  VBOX-00 | oo | 1234567890 | 3.0
  ')
  # MR-00   | oo | 1234567890 | 3.0
HOSTS=(` echo "$SM_LIST" |awk -F"[\t |]+" '{print $2}' `)
  USERS=(` echo "$SM_LIST" |awk -F"[\t |]+" '{print $3}' `)
  PASSS=(` echo "$SM_LIST" |awk -F"[\t |]+" '{print $4}' `)
  VERSS=(` echo "$SM_LIST" |awk -F"[\t |]+" '{print $5}' `)
echo ----------
  echo ROOT  $ROOT
  echo HOSTS ${HOSTS[@]}
  echo USERS ${USERS[@]}
  echo PASSS ${PASSS[@]}
  echo VERSS ${VERSS[@]}

IPS=();   for i in {1..5} ;do
  IPS=(` for h in ${HOSTS[@]} \
    ; do \
    nmblookup -S $h \
    | grep -Eo "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" \
    ; done \
    `)
  # [ ${#IPS[@]} -ne 0 ] && break
  done
HOSTS=(); for i in {1..5} ;do
  HOSTS=(` for ip in ${IPS[@]} \
    ; do \
    nmblookup -A $ip \
    |grep -EA1 "status" \
    |grep -v "status" \
    |awk '{print $1}' \
    ; done \
    `)
  # [ ${#HOSTS[@]} -ne 0 ] && break
  done
USERS=(` for h in ${HOSTS[@]} \
  ; do \
  echo "$SM_LIST" \
  |grep "$h" \
  |awk -F"[\t |]+" '{print $3}' \
  ; done \
  `)
PASSS=(` for h in ${HOSTS[@]} \
  ; do \
  echo "$SM_LIST" \
  |grep "$h" \
  |awk -F"[\t |]+" '{print $4}' \
  ; done \
  `)
VERSS=(` for h in ${HOSTS[@]} \
  ; do \
  echo "$SM_LIST" \
  |grep "$h" \
  |awk -F"[\t |]+" '{print $5}' \
  ; done \
  `)
echo ----------
  echo IPS   ${#IPS[@]} ${IPS[@]} ${!IPS[@]}
  echo HOSTS ${#HOSTS[@]} ${HOSTS[@]} ${!HOSTS[@]}
  echo USERS ${USERS[@]}
  echo PASSS ${PASSS[@]}
  echo VERSS ${VERSS[@]}

DIRS=()
DIRS_SRC=()
DIRS_DST=()
for i in ${!IPS[@]} ;do
  dirts=$( \
    echo ${PASSS[i]} | smbclient -L ${IPS[i]} 2>/dev/null \
    | grep 'Disk' | grep -v '\\$' \
    | awk -F"[\t :]+" '{print $2}'
    )
  for d in $dirts ;do
    DIRS+=("$d")
    DIRS_SRC+=("//${IPS[i]}/$d")
    DIRS_DST+=("$ROOT/${HOSTS[i]}/$d")
    done
  done
echo ----------
  echo DIRS ${#DIRS[@]} ${DIRS[@]} ${!DIRS[@]}
  echo DIRS ${#DIRS_SRC[@]} ${DIRS_SRC[@]} ${!DIRS_SRC[@]}
  echo DIRS ${#DIRS_DST[@]} ${DIRS_DST[@]} ${!DIRS_DST[@]}

COUNT=$( \
  [ ${#HOSTS[@]} -ne 0 ] \
  && df -h \
  |grep -Eoc "$(echo "${HOSTS[@]}" |tr -s ' ' '|')" \
  || echo 0 \
  )
ENABLE=$( echo ${#IPS[@]} \
  |grep -Ec "[1-9]" \
  )
ACTIVE=$( \
  echo $COUNT \
  |grep -Ec "[1-9]" \
  )
echo ----------
  echo COUNT  $COUNT
  echo ENABLE $ENABLE
  echo ACTIVE $ACTIVE


function press_key {

  if [ $ENABLE -eq 0 ]; then return; fi
    # sleep 1
    echo ----------
    echo ACTIVE $ACTIVE

  if [ $ACTIVE -eq 0 ]; then
    for i in ${!IPS[@]}; do
      echo ----------
      echo $i ${IPS[i]} ${HOSTS[i]}
      dirts_src=($(for d in ${DIRS_SRC[@]} ;do echo $d ;done |grep "${IPS[i]}")  )
      dirts_dst=($(for d in ${DIRS_DST[@]} ;do echo $d ;done |grep "${HOSTS[i]}"))
      echo dirts_src ${#dirts_src[@]} ${dirts_src[@]}
      echo dirts_dst ${#dirts_dst[@]} ${dirts_dst[@]}
      echo ----------
      for j in ${!dirts_src[@]} ;do
        echo mount ${dirts_src[j]} ${dirts_dst[j]}
        sudo mkdir -p "${dirts_dst[j]}"
        sudo mount -t cifs \
          -o 'rw,uid=1000,gid=100' \
          -o "vers=${VERSS[i]}," \
          -o 'dir_mode=0770,file_mode=0770' \
          -o "username=${USERS[i]},password=${PASSS[i]}" \
          "${dirts_src[j]}" "${dirts_dst[j]}"
        done
      done

  else
    for i in ${!IPS[@]}; do
      echo ----------
      echo $i ${IPS[i]} ${HOSTS[i]}
      dirts_src=($(for d in ${DIRS_SRC[@]} ;do echo $d ;done |grep "${IPS[i]}")  )
      dirts_dst=($(for d in ${DIRS_DST[@]} ;do echo $d ;done |grep "${HOSTS[i]}"))
      echo dirts_src ${#dirts_src[@]} ${dirts_src[@]}
      echo dirts_dst ${#dirts_dst[@]} ${dirts_dst[@]}
      echo ----------
      for j in ${!dirts_src[@]} ;do
        echo umount ${dirts_src[j]} ${dirts_dst[j]}
        sudo umount -t cifs \
          "${dirts_dst[j]}"
        sudo rm -rf "${dirts_dst[j]}"
        done
      sudo rm -rf "$ROOT/${HOSTS[i]}"
      done
    fi

}


press_key


