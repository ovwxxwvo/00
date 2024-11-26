#!/usr/bin/env bash


LIST="
  # AA | UEFI   | rw,uid=$EUID,dmask=0007,fmask=0007
  # BB | VTOY   | rw,uid=$EUID,dmask=0007,fmask=0007
  # CC | WINS   | rw,uid=$EUID,dmask=0007,fmask=0007
  # DD | BATO   | rw,uid=$EUID,dmask=0007,fmask=0007
  # EE | CERA   | rw
  # HH | DATA   | rw
  "
  # OA | VBOX01 | rw,uid=$EUID,dmask=0007,fmask=0007

ROOT='/0000'
  SWAP='.swapfile'
  SWAPON=$( swapon --show \
    | grep -c "$SWAP" \
    )
  echo --------------------
  echo 'SWAPON ' $SWAPON

function set_var {
  echo --------------------
  echo set_var
  PREFIXS=(` \
    echo -n $LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $2}' \
    `)
  LABELS=(` \
    echo -n $LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $3}' \
    `)
  OPTIONS=(` \
    echo -n $LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $4}' \
    `)
  PARTS=(` \
    for i in ${!PREFIXS[@]} \
    ; do \
    sudo blkid \
    | grep "=\"${LABELS[i]}\"" \
    | grep -Eo "/dev/\w+" \
    ; if [ $? -eq 1 ]; then echo '#####'; fi \
    ; done \
    `)
  echo 'PREFIXS' ${#PREFIXS[@]} ${PREFIXS[@]}
  echo 'LABELS ' ${#LABELS[@]} ${LABELS[@]}
  # echo 'OPTIONS ' ${#OPTIONS[@]} ${OPTIONS[@]}
  echo --------------------
  echo 'PARTS ' ${#PARTS[@]} ${PARTS[@]}
  }

function get_var {
  echo --------------------
  echo get_var
  DIRS=(` \
    for i in ${!PREFIXS[@]} \
    ; do \
    ls -l $ROOT \
    | grep "${LABELS[i]}" \
    | grep -Eo "\w+¦\w+" \
    ; if [ $? -eq 1 ]; then echo '#####'; fi \
    ; done \
    `)
  MNTS=(` \
    for i in ${!PREFIXS[@]} \
    ; do \
    df -h \
    | grep "${LABELS[i]}" \
    | grep -Eo "$ROOT/\w+¦\w+" \
    ; if [ $? -eq 1 ]; then echo '#####'; fi \
    ; done \
    `)
  ISMKD=$( \
    echo ${DIRS[@]} |grep -c '#####' \
    )
  ISMNT=$( \
    echo ${MNTS[@]} |grep -c '#####' \
    )
  echo 'DIRS' ${#DIRS[@]} ${DIRS[@]}
  echo 'MNTS' ${#MNTS[@]} ${MNTS[@]}
  echo 'ismkd' $ISMKD
  echo 'ismnt' $ISMNT
  }

function set_nbd {
  echo set_nbd
  sudo modprobe nbd max_part=2
  sudo qemu-nbd -c \
    "/dev/nbd0" "/0000/HH¦HOME/20_vbox/vbox0.vdi"
  echo --------------------
  }

function mkd_part {
  echo --------------------
  echo mkdir
  if [ $ISMKD -eq 0 ]; then return; fi
  for i in ${!PREFIXS[@]}; do
    echo   " mkdir $ROOT/${PREFIXS[i]}¦${LABELS[i]} "
    sudo mkdir -p "$ROOT/${PREFIXS[i]}¦${LABELS[i]}"
    done
  }

function mnt_part {
  echo --------------------
  echo mount
  if [ $ISMNT -eq 0 ]; then return; fi
  for i in ${!PREFIXS[@]}; do
    if [ ${PARTS[i]} = '#####' ]; then continue; fi
    if [ ${MNTS[i]} != '#####' ]; then continue; fi
    echo " mount -L ${LABELS[i]} $ROOT/${PREFIXS[i]}¦${LABELS[i]} "
    sudo mount --onlyonce \
      -L "${LABELS[i]}" "$ROOT/${PREFIXS[i]}¦${LABELS[i]}" \
      -o "${OPTIONS[i]}"
    done
  }

function mnt_swap {
  echo 'swapon'
  echo --------------------
  if [ $SWAPON -ne 1 ]; then
    echo " swapon $ROOT/$SWAP "
    sudo swapon "$ROOT/$SWAP"
  fi
  }

set_var
get_var
mkd_part
get_var
mnt_part
echo =======================================
# set_nbd
# set_var
# get_var
# mnt_part
echo =======================================
mnt_swap


