#!/usr/bin/env bash



tput civis
#     
# showmethekey-cli |awk -F"[\t {\":,]+" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14}'


showmethekey-cli \
  |awk -F'[\t \"{:,_]+' \
  ' \
  { \
  if ($21=="PRESSED"){ print "--------------" } \
  if ($21=="PRESSED" ){ printf" %+8s   \n", $15 } \
  if ($21=="RELEASED"){ printf" %+8s   \n", $15 } \
  }'


