#!/usr/bin/env bash
##################################################
# Be careful about what you are trying to do.
# This script will replace the home config files.
# For example, the files in folder "/home" .
##################################################


OPT=' -av '
SRC='./home'
DST='/'
echo ==================== set var ===================
  echo SRC  : $SRC
  echo DST  : $DST

chmod_config() {
  echo ==================== chmod config ==============
  sudo chown -R oo:root $SRC
  sudo chmod -R 755     $SRC/00
  sudo chmod -R 744     $SRC/oo
  ls -al $SRC
  }

rsync_config() {
  echo ==================== rsync config ==============
  echo "rsync $OPT $SRC $DST -----"
  sudo rsync $OPT $SRC $DST
  }


chmod_config
rsync_config


