#!/usr/bin/env bash


MNT="/0000"
PRE="UD¦"
echo ---------- ----------
echo $MNT $PRE

UDISKS=(` lsblk |grep "disk" \
  |grep -o "sd[a-z]" \
  |grep -v "0B" \
  |sort -n \
  `)
UPARTS=(` lsblk |grep "part" \
  |grep -o "sd[a-z][1-9]" \
  |sort -n \
  `)
ULABELS=(` for i in ${!UPARTS[@]} ;do \
  sudo blkid \
  |grep "${UPARTS[i]}" \
  |grep -Eo " LABEL=\S+ " \
  |awk -F"[\t =\"]+" '{print $3}' \
  ;done `)
echo ---------- ----------
  echo UDISKS  ${#UDISKS[@]}  ${UDISKS[@]}
  echo UPARTS  ${#UPARTS[@]}  ${UPARTS[@]}
  echo LABELS ${#ULABELS[@]} ${ULABELS[@]}

ENABLE=$( lsblk |grep "part" \
  |grep -Ec "sd[a-z][1-9]" \
  |grep -Ec "[1-9]" \
  )
ACTIVE=$( lsblk |grep "part" \
  |grep -E "sd[a-z][1-9]" \
  |grep -Ec "$MNT" \
  |grep -Ec "[1-9]" \
  )
echo ---------- ----------
echo $ENABLE $ACTIVE


SRC_MNT=()
DST_MNT=()

get_path() {
  echo ---------- ---------- get mount -----------
  SRC_MNT=(` for i in ${!UPARTS[@]} ;do \
    echo "/dev/${UPARTS[i]}" \
    ;done `)
  DST_MNT=(` for i in ${!ULABELS[@]} ;do \
    echo "${MNT}/${PRE}${ULABELS[i]}" \
    ;done `)
  echo ---------- ----------
  echo SRC ${#SRC_MNT[@]} ${SRC_MNT[@]} ${!SRC_MNT[@]}
  echo DST ${#DST_MNT[@]} ${DST_MNT[@]} ${!DST_MNT[@]}
  }

function press_key {
  if [ $ENABLE -eq 0 ] ; then return ; fi
    echo ---------- ---------- press key  ----------

  if [ $ACTIVE -eq 0 ]; then
    for i in ${!UPARTS[@]}; do
      echo ---------- ----------
      echo $i ${UPARTS[i]}
      echo mkdir ${DST_MNT[i]}
      echo mount --onlyonce ${SRC_MNT[i]} ${DST_MNT[i]}
      sudo mkdir ${DST_MNT[i]}
      sudo mount --onlyonce ${SRC_MNT[i]} ${DST_MNT[i]}
      done

  else
    for i in ${!UPARTS[@]}; do
      echo ---------- ----------
      echo $i ${UPARTS[i]}
      echo umount ${DST_MNT[i]}
      echo rmdir  ${DST_MNT[i]}
      sudo umount ${DST_MNT[i]}
      sudo rmdir  ${DST_MNT[i]}
      done

  fi

  }

get_path
press_key


