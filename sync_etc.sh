#!/usr/bin/env bash
##################################################
# Be careful about what you are trying to do.
# This script will replace the system config files.
# For example, the files in folder "/etc" & "/usr" .
##################################################


OPT=' -av '
SRC='./'
DST='/'
SRCS=(
  'etc'
  'usr'
  )
SRCS=(` echo ${SRCS[@]} \
  |awk -v src="$SRC" \
    -v  FS="[\t ]+" -v  RS=" " \
    '{printf "%s%s\n", src, $0}' \
  `)
echo ==================== set var ===================
  echo SRC  : $SRC
  echo DST  : $DST
  echo SRCS : ${#SRCS[@]} ${SRCS[@]}

rsync_config() {
  # sudo rsync $OPT $SRC $DST
  echo ==================== rsync config ==============
  for s in ${SRCS[@]}
  do
    echo "rsync $OPT $s $DST -----"
    sudo chown -R root:root $s
    sudo chmod -R 755       $s
    sudo rsync $OPT $s $DST
    # rsync $OPT $s $DST
    echo -------------------- --------------------
    done
  }


rsync_config
# read -p ''


