#!/usr/bin/env bash


tmux splitw -h bash -c "
echo ========== ========== ========== ==========
echo $PWD/$1
echo ========== ========== ========== ==========
echo
bash $1
echo
echo ========== ========== ========== ==========
echo ========== ========== ========== ==========
echo PRESS ENTER TO EXIT ...
read
"


