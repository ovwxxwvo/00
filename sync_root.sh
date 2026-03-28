#!/usr/bin/env bash
##################################################
# Be careful about what you are trying to do.
# This script will replace the system config files.
# For example, the files in folder "/etc" & "/usr" .
##################################################

cd "$(dirname "$0")" || exit 1
pwd

USR="$USER"
GRP="$USR"
SRC='./'
DST='/'
OPT='-vuo --progress --exclude=".git"'
USER_SYS_DIR='/home/00'
SRCS=(
  'home/00'
  'etc'
  'usr'
  )
SRCS=(` echo ${SRCS[@]} \
  |awk -v src="$SRC" \
    -v  FS="[\t ]+" -v  RS=" " \
    '{printf "%s%s\n", src, $0}' \
  `)
echo ==================== set var ===================
  echo "SRC  : $SRC"
  echo "DST  : $DST"
  echo "SRCS : ${#SRCS[@]} ${SRCS[@]}"

chmod_config() {
  # sudo rsync $OPT $SRC $DST
  for s in "${SRCS[@]}" ;do
    echo ==================== chown $s ===========
    echo "$s"
    sudo chown -R "$USR:$GRP" "$s"
    # sudo chown -R "root:root" "$s"
    echo ==================== chmod $s ===========
    # sudo chmod -R 755       $s
    sudo find "$s" -type d -exec chmod 755 {} \;
    sudo find "$s" -type f -exec chmod 644 {} \;
    sudo find "$s" -type f \( -name "*.sh" -o -name "*.bsh" -o -name "*.dsh" \) -exec chmod 754 {} \;
      # dirt_path=$( find $s -type  d )
      # file_path=$( find $s -type f )
      # exec_path=$( find $s -type f |grep -E "/sway$" )
      # sudo chmod 755 $dirt_path
      # sudo chmod 644 $file_path
      # sudo chmod 755 $exec_path
    sudo chmod 755 "$s"
    ls -al "$s"
    echo -------------------- --------------------
    done
  }

rsync_config() {
  # sudo rsync $OPT $SRC $DST
  echo ==================== rsync config ==============
  for s in "${SRCS[@]}" ;do
    echo ==================== rsync config $s ===========
    echo "rsync $OPT $s $DST -----"
    sudo rsync $OPT "$s" "$DST"
    # rsync $OPT $s $DST
    echo -------------------- --------------------
    done
  }


chmod_config
rsync_config
# read -p ''


