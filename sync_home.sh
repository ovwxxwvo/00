#!/usr/bin/env bash
##################################################
# Be careful about what you are trying to do.
# This script will replace the home config files.
# For example, the files in folder "/home" .
##################################################

cd "$(dirname "$0")" || exit 1
pwd

# USR='oo'
USR="$USER"
GRP="$USR"
SRC="./home/oo/"
DST="/home/$USR/"
OPT='-vua --progress --exclude=".git"'
echo ==================== set var ===================
  echo "SRC  : $SRC"
  echo "DST  : $DST"

chmod_config() {
  echo ==================== chmod config ==============
  ls -al "$SRC"

  echo ==================== chown =====================
  chown -R "$USR:$GRP" "$SRC"
  ls -al "$SRC"

  echo ==================== chmod =====================
  find "$SRC" -type d -exec chmod 755 {} \;
  find "$SRC" -type f -exec chmod 644 {} \;
  find "$SRC" -type f \( -name "*.sh" -o -name "*.bsh" -o -name "*.dsh" \) -exec chmod 754 {} \;
    # dirt_path=$( find "$SRC" -type d )
    # file_path=$( find "$SRC" -type f )
    # exec_path=$( find "$SRC" -type f \
    #   |grep -E "\.sh$|\.bsh$|\.dsh$" \
    #   )
    # chmod 755 "$dirt_path"
    # chmod 644 "$file_path"
    # chmod 754 "$exec_path"
  # sudo chmod 755 "$SRC"
  ls -al "$SRC"

  }

rsync_config() {
  echo ==================== rsync config ==============
  echo "rsync $OPT $SRC $DST -----"
  rsync $OPT "$SRC" "$DST"
  }


chmod_config
rsync_config


