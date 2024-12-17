#!/usr/bin/env bash
##################################################
# Be careful about what you are trying to do.
# This script will replace the home config files.
# For example, the files in folder "/home" .
##################################################

USR='oo'
GRP='root'
OPT=' -av '
SRC='./home'
DST='/'
echo ==================== set var ===================
  echo SRC  : $SRC
  echo DST  : $DST

chmod_config() {
  echo ==================== chmod config ==============
  ls -al $SRC

  echo ==================== chown =====================
  sudo chown -R $USR:$GRP $SRC
  ls -al $SRC

  echo ==================== chmod =====================
  dirt_path=$( find $SRC -type d )
  file_path=$( find $SRC -type f )
  exec_path=$( find $SRC -type f \
    |grep -E "\.sh$|\.bsh$|\.dsh$" \
    )
  chmod 754 $dirt_path
  chmod 654 $file_path
  chmod 754 $exec_path
  sudo chmod 754 $SRC
  ls -al $SRC

  }

rsync_config() {
  echo ==================== rsync config ==============
  echo "rsync $OPT $SRC $DST -----"
  sudo rsync $OPT $SRC $DST
  }


chmod_config
rsync_config


