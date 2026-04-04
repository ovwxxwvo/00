#!/usr/bin/env bash
##################################################
# Be careful about what you are trying to do.
# This script will replace the home config files.
# For example, the files in folder "/home" .
##################################################

cd "$(dirname "$0")" || exit 1
pwd

USR="$USER"
GRP="$USR"
# OPT='-vur --progress --no-perms --no-owner --no-group --delete --exclude=".git" --exclude=".venv"'
OPT='-vur --progress --no-perms --no-owner --no-group --delete --exclude=".git" --exclude=".venv" --dry-run'
SRC="/0000/HH¦DATA/"
DST="/0000/UD¦BACKUP/"
DIRS=(
  '01_cipher'
  '02_config'
  '11_script'
  '21_memory'
  '22_asset'
  '23_note'
  '24_vessel'
  '25_log'
  '31_docmt'
  '32_image'
  '33_audio'
  '34_video'
  '35_study'
  '41_tool'
  )
  # '12_project'
  # '13_program'
  # '42_data'
  # '43_download'
SRCS=()
DSTS=()

get_path() {
  for dir in "${DIRS[@]}"; do
    SRCS+=("${SRC}${dir}/")
    DSTS+=("${DST}${dir}/")
    done
  echo ==================== set var ===================
    echo "SRC  : $SRC"
    echo "DST  : $DST"
    echo "SRCS : ${#SRCS[@]} ${SRCS[@]}"
    echo "DSTS : ${#DSTS[@]} ${DSTS[@]}"
  }

chmod_config() {
  for s in "${SRCS[@]}" ;do
    echo ==================== chown $s ===========
    echo "$s"
    # sudo chown -R "root:root" "$s"
    chown -R "$USR:$GRP" "$s"
    echo ==================== chmod $s ===========
    # sudo chmod -R 755       $s
    chmod 755 "$s"
    find "$s" -type d -exec chmod 755 {} \;
    find "$s" -type f -exec chmod 644 {} \;
    find "$s" -type f \( -name "*.sh" -o -name "*.py" -o -name "*.bsh" -o -name "*.dsh" \) -exec chmod 754 {} \;
    ls -al "$s"
    echo -------------------- --------------------
    done
  }

rsync_config() {
  # sudo rsync $OPT $SRC $DST
  echo ==================== rsync config ==============
  for i in "${!SRCS[@]}"; do
    src="${SRCS[$i]}"
    dst="${DSTS[$i]}"
    echo ==================== rsync config $dst ===========
    echo "rsync $OPT $src $dst"
    sudo rsync $OPT "$src" "$dst"
    done
  }


get_path
chmod_config
rsync_config


