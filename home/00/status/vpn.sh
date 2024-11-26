#!/usr/bin/env bash


# vpn
  IFS=$'\n'
  VN_EXPORT=(
    '\n # export  http_proxy=http://127.0.0.1:7890'
    '\n # export https_proxy=http://127.0.0.1:7890'
    )

# vpn
  # VN_PROFILE='../autoload/proxy.rc'
  VN_PROFILE='/home/00/autoload/proxy.rc'

# vpn
  VN_EXPORT=(` echo -e ${VN_EXPORT[@]} | grep '#' \
    | awk -F" # " '{print $2}' \
    `)
  # echo -e ${#VN_EXPORT[@]} ${VN_EXPORT[@]}

# vpn
  VN_ACTIVE=$( cat $VN_PROFILE | grep 'proxy' \
    | awk -F"[\t =]+" '{print $3}' \
    | grep -c 'http:' | grep -c '2' \
    )
  VN_PROXY=$( export | grep 'proxy' \
    | awk -F"[\t =\"]+" '{print $3}' \
    | grep -c 'http' | grep -c '2' \
    )
  VN_CLASH=$( ps -e | grep -o 'clash' \
    | grep -c 'clash' | grep -c '0' \
    | grep -c '0' \
    )
  # echo VN $VN_ACTIVE $VN_PROXY $VN_CLASH

echo -e \
  "\n VN_ACTIVE=$VN_ACTIVE" \
  "\n VN_PROXY=$VN_PROXY"   \
  "\n VN_CLASH=$VN_CLASH"   \
  ""


