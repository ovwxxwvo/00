#!/usr/bin/env bash


# samba
  IFS=$'\n'
  SM_LIST=(
    '\n # HW-00   # oo # 123456789 # 1.0 '
    '\n # MR-00   # oo # 0         # 3.0 '
    '\n # VBOX-00 # oo # 0         # 3.0 '
    )
  echo -e ${#SM_LIST[@]} ${SM_LIST[@]}
  echo

# samba
  SM_ROOT='/mnt'
  # SM_PREFIX='X'
  SM_HOSTS=(` \
    echo -e ${SM_LIST[@]} | grep '#' \
    | awk -F"[\t #]+" '{print $2}' \
    `)
  echo ${#SM_HOSTS[@]} ${SM_HOSTS[@]}
  echo

# samba
  SM_IPS=(` for i in ${!SM_HOSTS[@]} \
    ; do \
    nmblookup -S ${SM_HOSTS[i]} | grep 'status' \
    | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' \
    ; done \
    `)
  SM_HOSTS=(` for i in ${!SM_IPS[@]} \
    ; do \
    nmblookup -A ${SM_IPS[i]} \
    | grep '<00>' | grep -v '<GROUP>' \
    | awk -F"[\t ]+" '{print $2}' \
    ; done \
    `)
  SM_USERS=(` for i in ${!SM_IPS[@]} \
    ; do \
    echo -e ${SM_LIST[@]} | grep '#' \
    | grep ${SM_HOSTS[i]} \
    | awk -F"[\t #]+" '{print $3}' \
    ; done \
    `)
  SM_PASSS=(` for i in ${!SM_IPS[@]} \
    ; do \
    echo -e ${SM_LIST[@]} | grep '#' \
    | grep ${SM_HOSTS[i]} \
    | awk -F"[\t #]+" '{print $4}' \
    ; done \
    `)
  SM_VERSS=(` for i in ${!SM_IPS[@]} \
    ; do \
    echo -e ${SM_LIST[@]} | grep '#' \
    | grep ${SM_HOSTS[i]} \
    | awk -F"[\t #]+" '{print $5}' \
    ; done \
    `)
  echo ${#SM_IPS[@]}   ${SM_IPS[@]}
  echo ${#SM_HOSTS[@]} ${SM_HOSTS[@]}
  echo ${#SM_USERS[@]} ${SM_USERS[@]}
  echo ${#SM_PASSS[@]} ${SM_PASSS[@]}
  echo ${#SM_VERSS[@]} ${SM_VERSS[@]}

# samba
  SM_DIRHS=(` ls "$SM_ROOT" \
    | grep "^$SM_PREFIX"
    `)
  SM_LETTERS=(` for i in ${!SM_IPS[@]} \
    ; do \
    letter=$( ls "$SM_ROOT" \
      | grep "^$SM_PREFIX" \
      | grep "${SM_HOSTS[i]}" \
      | grep -o '^..' | grep -o '.$' \
      )
    if [ "$letter" == '' ]; then
      for l in {A..Z}; do
        count=$( echo ${SM_DIRHS[@]} \
          | grep -o '^..' | grep -o '.$' \
          | grep -c "$l" \
          )
        if [ $count -eq 0 ]; then
          echo $l; break; fi;
      done
    else
      echo $letter
      fi \
    ; done \
    `)
  SM_PREFIXS=(` for i in ${!SM_IPS[@]} \
    ; do \
    echo "$SM_PREFIX${SM_LETTERS[i]}¦" \
    ; done \
    `)
  echo ${#SM_DIRHS[@]} ${SM_DIRHS[@]}
  echo ${#SM_LETTERS[@]} ${SM_LETTERS[@]}
  echo ${#SM_PREFIXS[@]} ${SM_PREFIXS[@]}

# samba
  SM_MNTS=(` df -h \
    | grep '//' \
    | grep -o "$SM_ROOT/$SM_PREFIX.\+"
    `)
  SM_DIRS=(` \
    for i in ${!SM_IPS[@]} \
    ; do \
    echo ${SM_PASSS[i]} | smbclient -L ${SM_IPS[i]} \
    2>/dev/null \
    | grep 'Disk' | grep -v '\\$' \
    | awk -F"[\t :]+" '{print $2}' \
    ; done \
    `)
  echo m ${#SM_MNTS[@]} ${SM_MNTS[@]}
  echo d ${#SM_DIRS[@]} ${SM_DIRS[@]}

# samba
  SM_ENABLE=(` \
    if [ ${#SM_IPS[@]} -eq 0 ] \
    ; then echo 0 ; else echo 1 ; fi \
    `)
  SM_ACTIVE=(` \
    if [ ${#SM_MNTS[@]} -eq 0 ] \
    ; then echo 0 ; else echo 1 ; fi \
    `)
  SM_STATE=(` \
    if [ ${#SM_MNTS[@]} -ne ${#SM_DIRS[@]} ] \
    ; then echo 0 ; else echo 1 ; fi \
    `)
  # echo SM $SM_ENABLE $SM_ACTIVE $SM_STATE

echo -e \
  "\n SM_ENABLE=$SM_ENABLE" \
  "\n SM_ACTIVE=$SM_ACTIVE" \
  "\n SM_STATE=$SM_STATE"   \
  ""


