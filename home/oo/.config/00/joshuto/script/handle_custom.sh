#!/usr/bin/env bash


# source this file in preview_file.sh
handle_custom() {
  # var:FILE_EXTENSION_LOWER come from the preview_file.sh
  local file_extension="${FILE_EXTENSION_LOWER}"
  # tmux display-message  "${file_extension} $e"
  case "${file_extension}" in
    jpg | png | gif )
      # exiftool "/home/02_photo/00.jpg" \
      exiftool "${FILE_PATH}" \
        |sed 's/  */ /g' \
        |awk -F"[:]" ' BEGIN{IGNORECASE=1} \
          END{ print "04 | ---------- ---------- ---------- ----------"; \
               print "08 | ---------- ---------- ---------- ----------"; \
               } \
          /^file name/     { printf "01 | %-20s:%-20s \n", $1, $NF ;next } \
          /^file type ext/ { printf "02 | %-20s:%-20s \n", $1, $NF ;next } \
          /^mime type/     { printf "03 | %-20s:%-20s \n", $1, $NF ;next } \
          /^image size/    { printf "05 | %-20s:%-20s \n", $1, $NF ;next } \
          /^bit per/       { printf "06 | %-20s:%-20s \n", $1, $NF ;next } \
          /^megapixels/    { printf "07 | %-20s:%-20s \n", $1, $NF ;next } \
          /^make /         { printf "09 | %-20s:%-20s \n", $1, $NF ;next } \
          /^camera model / { printf "10 | %-20s:%-20s \n", $1, $NF ;next } \
          ' \
        |sort |awk -F"|" '{print $2 }'
      exit 0
      ;;
    mp3 | m4a | aac | ogg )
      # exiftool "/home/03_audio/music_00/Beyond -  海阔天空(Live93).mp3" \
      exiftool "${FILE_PATH}" \
        |sed 's/  */ /g' \
        |awk -F"[:]" ' BEGIN{IGNORECASE=1} \
          END{ print "04 | ---------- ---------- ---------- ----------"; \
               print "08 | ---------- ---------- ---------- ----------"; \
               } \
          /^file name/     { printf "01 | %-20s:%-20s \n", $1, $NF ;next } \
          /^file type ext/ { printf "02 | %-20s:%-20s \n", $1, $NF ;next } \
          /^mime type/     { printf "03 | %-20s:%-20s \n", $1, $NF ;next } \
          /^audio bitrate/ { printf "05 | %-20s:%-20s \n", $1, $NF ;next } \
          /^sample rate/   { printf "06 | %-20s:%-20s \n", $1, $NF ;next } \
          /^channel mode/  { printf "07 | %-20s:%-20s \n", $1, $NF ;next } \
          /^artist/        { printf "09 | %-20s:%-20s \n", $1, $NF ;next } \
          /^title/         { printf "10 | %-20s:%-20s \n", $1, $NF ;next } \
          /^album/         { printf "11 | %-20s:%-20s \n", $1, $NF ;next } \
          ' \
        |sort |awk -F"|" '{print $2 }'
      exit 0
      ;;
    mp4 | mkv | flv | avi )
      # exiftool "/home/04_video/11_sport/Allen/Allen.Iverson-00.No.Longer.Young.But.Stronger.mp4" \
      exiftool "${FILE_PATH}" \
        |sed 's/  */ /g' \
        |awk -F"[:]" ' BEGIN{IGNORECASE=1} \
          END{ print "04 | ---------- ---------- ---------- ----------"; \
               print "08 | ---------- ---------- ---------- ----------"; \
               } \
          /^file name/     { printf "01 | %-20s:%-20s \n", $1, $NF ;next } \
          /^file type ext/ { printf "02 | %-20s:%-20s \n", $1, $NF ;next } \
          /^mime type/     { printf "03 | %-20s:%-20s \n", $1, $NF ;next } \
          /^video frame/   { printf "05 | %-20s:%-20s \n", $1, $NF ;next } \
          /^audio sample/  { printf "06 | %-20s:%-20s \n", $1, $NF ;next } \
          /^image size/    { printf "07 | %-20s:%-20s \n", $1, $NF ;next } \
          /^video codec/   { printf "09 | %-20s:%-20s \n", $1, $NF ;next } \
          /^audio codec/   { printf "10 | %-20s:%-20s \n", $1, $NF ;next } \
          ' \
        |sort |awk -F"|" '{print $2 }'
      exit 0
      ;;
  esac
  }

handle_custom


