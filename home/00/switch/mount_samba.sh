#!/usr/bin/env bash


MNT="/0000"
PRE="SM¦"
echo ---------- ----------
echo $MNT $PRE

LIST=('
  HW-00   | oo | 1234567890 | 1.0
  VBOX-00 | oo | 1234567890 | 3.0
  ')
  # MR-00   | oo | 1234567890 | 3.0
HOSTS=(` echo "$LIST" |awk -F"[\t |]+" '{print $2}' `)
USERS=(` echo "$LIST" |awk -F"[\t |]+" '{print $3}' `)
PASSS=(` echo "$LIST" |awk -F"[\t |]+" '{print $4}' `)
VERSS=(` echo "$LIST" |awk -F"[\t |]+" '{print $5}' `)
echo ---------- ----------
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
  done
USERS=(` for h in ${HOSTS[@]} \
  ; do \
  echo "$LIST" \
  |grep "$h" \
  |awk -F"[\t |]+" '{print $3}' \
  ; done \
  `)
PASSS=(` for h in ${HOSTS[@]} \
  ; do \
  echo "$LIST" \
  |grep "$h" \
  |awk -F"[\t |]+" '{print $4}' \
  ; done \
  `)
VERSS=(` for h in ${HOSTS[@]} \
  ; do \
  echo "$LIST" \
  |grep "$h" \
  |awk -F"[\t |]+" '{print $5}' \
  ; done \
  `)
echo ---------- ----------
  echo IPS   ${#IPS[@]}   ${IPS[@]}   ${!IPS[@]}
  echo HOSTS ${#HOSTS[@]} ${HOSTS[@]} ${!HOSTS[@]}
  echo USERS ${#USERS[@]} ${USERS[@]}
  echo PASSS ${#PASSS[@]} ${PASSS[@]}
  echo VERSS ${#VERSS[@]} ${VERSS[@]}

ENABLE=$( for h in ${HOSTS[@]} ; do \
    nmblookup -S $h \
    | grep -Eo "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" \
    ; done \
  |grep -Ec "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" \
  |grep -Ec "[1-9]" \
  )
ACTIVE=$( mount \
  |grep -E "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" \
  |grep -Ec "$MNT" \
  |grep -Ec "[1-9]" \
  )
echo ---------- ----------
echo $ENABLE $ACTIVE


SRC_MNT=()
DST_MNT=()

get_path() {
  for i in ${!IPS[@]} ;do
    dirts=$( \
      echo ${PASSS[i]} | smbclient -L ${IPS[i]} 2>/dev/null \
      | grep 'Disk' | grep -v '\\$' \
      | awk -F"[\t :]+" '{print $2}'
      )
    for d in $dirts ;do
      DIRS+=("$d")
      SRC_MNT+=("//${IPS[i]}/$d")
      DST_MNT+=("${MNT}/${PRE}${HOSTS[i]}/$d")
      done
    done
  echo ---------- ---------- get mount  -----------
  echo SRC ${#SRC_MNT[@]} ${SRC_MNT[@]} ${!SRC_MNT[@]}
  echo DST ${#DST_MNT[@]} ${DST_MNT[@]} ${!DST_MNT[@]}
  }

function press_key {
  if [ $ENABLE -eq 0 ]; then return; fi
    echo ---------- ---------- press key  ----------

  if [ $ACTIVE -eq 0 ]; then
    for i in ${!IPS[@]}; do
      echo ---------- ----------
      echo $i ${IPS[i]} ${HOSTS[i]}
      src_mnt=($(for d in ${SRC_MNT[@]} ;do echo $d ;done |grep "${IPS[i]}")  )
      dst_mnt=($(for d in ${DST_MNT[@]} ;do echo $d ;done |grep "${HOSTS[i]}"))
      echo src_mnt ${#src_mnt[@]} ${src_mnt[@]}
      echo dst_mnt ${#dst_mnt[@]} ${dst_mnt[@]}
      echo ---------- ----------
      for j in ${!src_mnt[@]} ;do
        echo mkdir -p "${dst_mnt[j]}"
        echo mount ${src_mnt[j]} ${dst_mnt[j]}
        sudo mkdir -p "${dst_mnt[j]}"
        sudo mount --onlyonce -t cifs \
          -o 'rw,uid=1000,gid=100' \
          -o "vers=${VERSS[i]}," \
          -o 'dir_mode=0770,file_mode=0770' \
          -o "username=${USERS[i]},password=${PASSS[i]}" \
          "${src_mnt[j]}" "${dst_mnt[j]}"
        done
      done

  else
    for i in ${!IPS[@]}; do
      echo ---------- ----------
      echo $i ${IPS[i]} ${HOSTS[i]}
      src_mnt=($(for d in ${SRC_MNT[@]} ;do echo $d ;done |grep "${IPS[i]}")  )
      dst_mnt=($(for d in ${DST_MNT[@]} ;do echo $d ;done |grep "${HOSTS[i]}"))
      echo src_mnt ${#src_mnt[@]} ${src_mnt[@]}
      echo dst_mnt ${#dst_mnt[@]} ${dst_mnt[@]}
      echo ---------- ----------
      for j in ${!src_mnt[@]} ;do
        echo umount ${src_mnt[j]} ${dst_mnt[j]}
        echo rmdir "${dst_mnt[j]}"
        sudo umount -t cifs "${dst_mnt[j]}"
        sudo rmdir "${dst_mnt[j]}"
        done
      sudo rmdir "${MNT}/${PRE}${HOSTS[i]}"
      done
    fi

  }

get_path
press_key


