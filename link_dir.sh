#!/usr/bin/env bash
##################################################
# This script will link some folder to "/home".
# This may just be for personal use.
##################################################


file_names=(
  '00_config'
  '00_cipher'
  '02_script'
  '04_project'
  '06_program'
  '08_game'
  '50_vbox'
  '80_download'
  )
dirt_home='/home/'
dirt_data='/0000/HH¦DATA/'


set_type() {
  # chown -R oo:root  "${dirt_data}"
  # chmod -R 774      "${dirt_data}"
  find "$dirt_data" -type f |grep -E \
    "\.md\$|\.txt\$|\.pdf\$|\.jpg\$|\.png\$|\.gif\$|\.mp3\$|\.wav\$|\.aac\$|\.ogg\$|\.mp4\$|\.mkv\$|\.flv\$|\.avi\$|\.7z\$|\.zip\$|\.rar\$|\.tar\$|\.gz\$" \
    |while read line; do
      echo $line
      chmod 664 "$line"
      done
    # read -p '=='
  }

link_folder() {
  # echo '---------- ---------- ---------- ----------'
    # for n in ${file_names[@]} ;do
    # if [ ! -e "${dirt_home}${n}" ] ;then
    #   ln -s  "${dirt_data}${n}"  "${dirt_home}${n}"
    #   echo ln -s  "${dirt_data}${n}"  "${dirt_home}${n}"
    #   echo $n
    #   fi
    # done
  echo '---------- ---------- ---------- ----------'
  for n in ${file_names[@]} ;do
    name=$(echo $n |grep -Eo "[a-zA-Z]+")
    if [ ! -e "${dirt_home}${name}" ] ;then
      ln -s  "${dirt_data}${n}"  "${dirt_home}${name}"
      echo ln -s  "${dirt_data}${n}"  "${dirt_home}${name}"
      echo $n
      fi
    done
  }

link_special() {
  ln -s  /home/oo/.config  /root/
  ln -s  /home/oo/.local   /root/

  ln -s  ~/.config/fcitx5  ~/.local/share/fcitx5
  ln -s  ~/.config/kodi    ~/.kodi
  }


# set_type

link_folder
# link_special

