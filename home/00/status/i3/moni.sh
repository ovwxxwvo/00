#!/usr/bin/env bash


# monitor
  MONI_FILE="$HOME/.Xresources"

# monitor
  MONI_PRIM=$( xrandr \
    | grep -A1 ' connected primary ' \
    | grep -Eoi "^[a-z0-9-]+|\+[0-9]+\+[0-9]+|\s[0-9]+x[0-9]+\s|.\+\s+[0-9]+\.[0-9]+" \
    | awk \
        -v  FS="[\t *+]+" -v  RS="--" \
        -v OFS=" | "      -v ORS=" \n" \
        '{ \
        if($(NF-3)==$1) \
        print "#",$1,$(NF-2),$NF,"-","-","\n"; \
        else
        print "#",$1,$(NF-2),$NF,$2,$3,"\n"; \
        }' \
    )
  MONI_LIST=$( xrandr \
    | grep -v 'primary' \
    | grep -A1 " connected " \
    | grep -Eoi "^[a-z0-9-]+|\+[0-9]+\+[0-9]+|\s[0-9]+x[0-9]+\s|.\+\s+[0-9]+\.[0-9]+" \
    | awk \
        -v  FS="[\t *+]+" -v  RS="--" \
        -v OFS=" | "      -v ORS=" \n" \
        '{ \
        if($(NF-3)==$1) \
        print "#",$1,$(NF-2),$NF,"-","-","\n"; \
        else
        print "#",$1,$(NF-2),$NF,$2,$3,"\n"; \
        }' \
    )
  # echo $MONI_PRIM
  # echo $MONI_LIST
  echo --------------------

# monitor
  MONI_DEVS=(` \
    echo $MONI_PRIM \
    | awk -v RS="#" -v FS="[\t |]+" '{print $2}' \
    ; \
    echo $MONI_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $2}' \
    `)
  MONI_MODES=(` \
    echo $MONI_PRIM \
    | awk -v RS="#" -v FS="[\t |]+" '{print $3}' \
    ; \
    echo $MONI_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $3}' \
    `)
  MONI_RATES=(` \
    echo $MONI_PRIM \
    | awk -v RS="#" -v FS="[\t |]+" '{print $4}' \
    ; \
    echo $MONI_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $4}' \
    `)
  MONI_PTNXS=(` \
    echo $MONI_PRIM \
    | awk -v RS="#" -v FS="[\t |]+" '{print $5}' \
    ; \
    echo $MONI_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $5}' \
    `)
  MONI_PTNYS=(` \
    echo $MONI_PRIM \
    | awk -v RS="#" -v FS="[\t |]+" '{print $6}' \
    ; \
    echo $MONI_LIST \
    | awk -v RS="#" -v FS="[\t |]+" '{print $6}' \
    `)
  echo 'MONI_DEVS[' ${#MONI_DEVS[@]} ${MONI_DEVS[@]}
  echo 'MONI_MODES' ${#MONI_MODES[@]} ${MONI_MODES[@]}
  echo 'MONI_RATES' ${#MONI_RATES[@]} ${MONI_RATES[@]}
  # echo 'MONI_PTNXS' ${#MONI_PTNXS[@]} ${MONI_PTNXS[@]}
  # echo 'MONI_PTNYS' ${#MONI_PTNYS[@]} ${MONI_PTNYS[@]}
  # echo ${!MONI_ACTS[@]}
  # echo ${!MONI_DEVS[@]}
  # echo ----------------

# monitor
  MONI_SAME=$( \
    echo ${MONI_PTNXS[@]} ${MONI_PTNYS[@]} \
    | awk -v FS="[\t ]+" -v OFS="\n" '{print $1,$2,$3,$4,$5,$6}' \
    | grep -Eoc "\<${MONI_PTNXS[0]}\>|\<${MONI_PTNYS[0]}\>" \
    | grep -c "$[${#MONI_DEVS[@]}*2]" \
    )
  MONI_INTER=$( \
    echo ${MONI_PTNXS[0]} ${MONI_PTNYS[0]} \
    | grep -Eoc "[-]+" \
    | grep -c '0' \
    )
  MONI_EXTER=$( \
    echo ${MONI_PTNXS[*]:1:${#MONI_PTNXS[@]}} ${MONI_PTNYS[*]:1:${#MONI_PTNYS[@]}} \
    | grep -Eoc "[-]+" \
    | grep -c '0' \
    )
  echo 'MONI_SAME ' $MONI_SAME
  echo 'MONI_INTER' $MONI_INTER
  echo 'MONI_EXTER' $MONI_EXTER

# monitor
  # return if only one monitor
  MONI_ONLYONE=$( \
    if [ ${#MONI_DEVS[@]} -eq 1 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
  # output monitor sameas   to internal
  MONI_SAMEA2INTER=$( \
    if [[ "$MONI_PRIM" != '' ]] \
    && [ $MONI_SAME -ge 1 ] \
    && [ $MONI_EXTER -eq 1 ] \
    && [ $MONI_INTER -eq 1 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
  # output monitor internal to external
  MONI_INTER2EXTER=$( \
    if [[ "$MONI_PRIM" != '' ]] \
    && [ $MONI_INTER -eq 1 ] \
    && [ $MONI_EXTER -eq 0 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
  # output monitor external to total
  MONI_EXTER2TOTAL=$( \
    if [[ "$MONI_PRIM" != '' ]] \
    && [ $MONI_EXTER -eq 1 ] \
    && [ $MONI_INTER -eq 0 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
  # output monitor total    to sameas
  MONI_TOTAL2SAMEA=$( \
    if [ $MONI_SAME -eq 0 ] \
    && [ $MONI_EXTER -eq 1 ] \
    && [ $MONI_INTER -eq 1 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
  # output monitor sameas   to total
  MONI_SAMEA2TOTAL=$( \
    if [[ "$MONI_PRIM" == '' ]] \
    && [ $MONI_SAME -eq 1 ] \
    && [ $MONI_EXTER -eq 1 ] \
    && [ $MONI_INTER -eq 1 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
  # output monitor single   to total
  MONI_SINGL2TOTAL=$( \
    if [[ "$MONI_PRIM" == '' ]] \
    && [ $MONI_SAME -eq 0 ] \
    && [ $MONI_EXTER -eq 0 ] \
    ; \
    then echo 1; \
    else echo 0; \
    fi \
    )
# read -p ''
  # echo ----
  # echo $MONI_ONLYONE
  # echo ----
  # echo 'MONI_SAMEA2INTER' $MONI_SAMEA2INTER
  # echo 'MONI_INTER2EXTER' $MONI_INTER2EXTER
  # echo 'MONI_EXTER2TOTAL' $MONI_EXTER2TOTAL
  # echo 'MONI_TOTAL2SAMEA' $MONI_TOTAL2SAMEA
  # echo 'MONI_SAMEA2TOTAL' $MONI_SAMEA2TOTAL
  # echo 'MONI_SINGL2TOTAL' $MONI_SINGL2TOTAL


