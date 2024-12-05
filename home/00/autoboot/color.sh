#!/usr/bin/env bash


echo set color

for tty in /dev/tty{1..6}
do

echo -en  "\e]P0101010"  >  "$tty"

echo -en  "\e]P1b05080"  >  "$tty"
echo -en  "\e]P250b080"  >  "$tty"
echo -en  "\e]P45080b0"  >  "$tty"
echo -en  "\e]P3b08050"  >  "$tty"
echo -en  "\e]P680b050"  >  "$tty"
echo -en  "\e]P58050b0"  >  "$tty"

echo -en  "\e]P7d0d0d0"  >  "$tty"
echo -en  "\e]P8303030"  >  "$tty"

echo -en  "\e]P9b05050"  >  "$tty"
echo -en  "\e]PA50b050"  >  "$tty"
echo -en  "\e]PC5050b0"  >  "$tty"
echo -en  "\e]PBb0b050"  >  "$tty"
echo -en  "\e]PE50b0b0"  >  "$tty"
echo -en  "\e]PDb050b0"  >  "$tty"

echo -en  "\e]PFf0f0f0"  >  "$tty"

done


