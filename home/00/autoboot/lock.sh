#!/usr/bin/env bash


echo 'set key'

for tty in /dev/tty{1..6}
do
  /usr/bin/setleds -D +num  < "$tty"
  /usr/bin/setleds -D -caps < "$tty"
done


