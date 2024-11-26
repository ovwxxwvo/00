#!/usr/bin/env bash


# /usr/bin/setleds -D +num  < '/dev/console' ;
# /usr/bin/setleds -D -caps < '/dev/console' ;

for tty in /dev/tty{1..6}
do
  /usr/bin/setleds -D +num  < "$tty" ;
  /usr/bin/setleds -D -caps < "$tty" ;
done


