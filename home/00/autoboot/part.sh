#!/usr/bin/env bash


ROOT='/0000'
SWAP='.swapfile'
LIST=(
  "AA | UEFI | rw,uid=1000 "
  "BB | VTOY | rw,uid=1000 "
  "CC | WINS | rw,uid=1000 "
  "DD | BATO | rw,uid=1000 "
  "EE | CERA | rw          "
  "HH | DATA | rw          "
  )
  # "AA | UEFI | rw,dmask=0007,fmask=0007 "
  # "BB | VTOY | rw,dmask=0007,fmask=0007 "
  # "CC | WINS | rw,dmask=0007,fmask=0007 "
  # "DD | BATO | rw,dmask=0007,fmask=0007 "
  # OA | VBOX01 | rw,uid=$EUID,dmask=0007,fmask=0007

mnt_part() {
  echo '---------- ---------- mount  ---------- ----------'
  # echo -e "${LIST[@]}"
  for m in "${LIST[@]}" ;do
    mnt=$( echo $m \
      |awk -F'[\t |]+' -v root="$ROOT" \
        '{printf "mount --onlyonce -L %s %s/%s¦%s -o %s\n", $2,root,$1,$2,$3}'
      )
    echo $mnt
    eval $mnt
    done
  }

mnt_swap() {
  echo '---------- ---------- swapon ---------- ----------'
  file="$ROOT"/"$SWAP"
  state=$( swapon --show |grep -c "$file" )
  echo swapon $file $state
  [ $state -ne 1 ] && swapon "$file"
  }


mnt_part
mnt_swap


