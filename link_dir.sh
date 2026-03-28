#!/usr/bin/env bash
##################################################
# This script will link some folder to "/home".
# This may just be for personal use.
##################################################


dir_names=(
  '01_cipher'
  '02_config'
  '11_script'
  '12_project'
  '13_program'
  '41_tool'
  '42_data'
  '43_download'
  )
_dir_data='/0000/HH¦DATA'
dir_data='/data'
dir_home='/home'


set_type() {
  # chown -R oo:root  "${dir_data}"
  # chmod -R 774      "${dir_data}"
  find "$dir_data" -type f |grep -E \
    "\.md\$|\.txt\$|\.pdf\$|\.jpg\$|\.png\$|\.gif\$|\.mp3\$|\.wav\$|\.aac\$|\.ogg\$|\.mp4\$|\.mkv\$|\.flv\$|\.avi\$|\.7z\$|\.zip\$|\.rar\$|\.tar\$|\.gz\$" \
    |while read line; do
      echo $line
      chmod 664 "$line"
      done
    # read -p '=='
  }

link_folder() {
  echo '---------- ---------- ---------- ----------'
  [ ! -d "$dir_data" ] \
    && sudo ln -snf  "${_dir_data}"  "${dir_data}" \
    && echo "sudo ln -snf  ${_dir_data}  ${dir_data}"
  for src_name in "${dir_names[@]}" ;do
    # name=$(echo $n |grep -Eo "[a-zA-Z]+")
    dst_name="${src_name##*[0-9_]}"
    src="${dir_data}/${src_name}"
    dst="${dir_home}/${dst_name}"
    echo "$src_name $dst_name"
    [   -d "$src" ] || continue
    [ ! -d "$dst" ] || continue
    ln -snf  "$src"  "$dst"
    echo "ln -snf $src $dst"
    done
  }


# set_type
link_folder


