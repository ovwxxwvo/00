#!/usr/bin/env bash


tmux splitw -h bash -c "
echo ========== ========== ========== ==========
echo $PWD/$1
echo ========== ========== ========== ==========
echo
echo gcc -o main $1
echo
echo ...
echo
gcc -o main $1
./main
echo
echo ========== ========== ========== ==========
echo ========== ========== ========== ==========
echo PRESS ENTER TO EXIT ...
read
"


