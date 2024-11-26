#!/usr/bin/env bash


# udisk
  U_ROOT='/0000'
  U_PREFIX='U'

# udisk
  U_DISKS=(` lsblk | grep 'disk' \
    | grep -v '0B' \
    | grep -o 'sd[a-z]' \
    `)
  U_PARTS=(` lsblk | grep 'part' \
    | grep -o 'sd[a-z][1-9]' \
    `)
  U_LABELS=(` \
    for i in ${!U_PARTS[@]} \
    ; do \
    sudo blkid \
    | grep "${U_PARTS[i]}" \
    | sort -n \
    | grep -Eo " LABEL=\S+ " \
    | awk -F"[\t =\"]+" '{print $3}' \
    ; done \
    `)
  # echo ${#U_DISKS[@]} ${U_DISKS[@]}
  # echo ${#U_PARTS[@]} ${U_PARTS[@]}
  # echo ${#U_LABELS[@]} ${U_LABELS[@]}

# udisk
  U_LETTERS=(` echo ${U_PARTS[@]} \
    | grep -o 'sd[a-z]' \
    | awk -F"sd" '{print toupper($2)}' \
    `)
  U_PREFIXS=(` for i in ${!U_PARTS[@]} \
    ; do \
    echo "$U_PREFIX${U_LETTERS[i]}¦" \
    ; done \
    `)
  # echo ${#U_LETTERS[@]} ${U_LETTERS[@]}
  # echo ${#U_PREFIXS[@]} ${U_PREFIXS[@]}

# udisk
  U_MNTS=(` lsblk | grep 'part' \
    | grep 'sd[a-z][1-9]' \
    | grep -o "$U_ROOT/$U_PREFIX.\+"
    `)
  # echo ${#U_MNTS[@]} ${U_MNTS[@]}

# udisk
  U_ENABLE=(` \
    if [ ${#U_DISKS[@]} -eq 0 ] \
    ; then echo 0 ; else echo 1 ; fi \
    `)
  U_ACTIVE=(` \
    if [ ${#U_MNTS[@]} -eq 0 ] \
    ; then echo 0 ; else echo 1 ; fi \
    `)
  U_STATE=(` \
    if [ ${#U_MNTS[@]} -ne ${#U_PARTS[@]} ] \
    ; then echo 0 ; else echo 1 ; fi \
    `)
  # echo U $U_ENABLE $U_ACTIVE $U_STATE

echo -e \
  "\n U_ENABLE=$U_ENABLE" \
  "\n U_ACTIVE=$U_ACTIVE" \
  "\n U_STATE=$U_STATE"   \
  ""


