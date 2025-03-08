#!/usr/bin/env bash


title="$cfg_title"
class="$cfg_class"
opac="$cfg_opac"
size="$cfg_size"
cmd="$cfg_cmd"
clrfg="$cfg_fg"
clrbg="$cfg_bg"


echo ==================== ala ================
echo $title
echo $class
echo $opac
echo $size
echo $cmd


alacritty \
  --title   "$title" \
  --class   "$class" \
  --option  "window.opacity=$opac" \
  --option  "font.size=$size" \
  --option  "colors.primary={foreground=$clrfg,background=$clrbg}" \
  --command "$cmd" \
  &


