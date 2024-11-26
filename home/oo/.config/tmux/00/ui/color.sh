# TMUX config, terminal multiplexer.
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.08.12


# get var
  pts=$( tmux display-message -p "#{pane_tty}" )
  cmd=$( \
    ps -o comm= -t $pts \
    | grep -Ev 'mpv|findmnt' \
    | tail -n 1 \
    )
  # tmux display-message "#{pane_tty}"

# set, sh | ra | vi , in different color
  if   [[ $cmd =~ nvim ]]; then
    color_window="fg=#50b080,bg=#0d1a14"
    color_border="fg=#30d080,bg=#002010"
    color_status="fg=#a0ffd0,bg=#0d1a14"
    color_stalft="fg=#50b080,bg=#0d1a14"
    color_starft="fg=#a0ffd0,bg=#0d1a14"
    color_stawnf="fg=#60a080,bg=#0d1a14"
    color_stawfc="fg=#50b080,bg=#0d1a14"
  elif [[ $cmd =~ yazi ]]; then
    color_window="fg=#5080b0,bg=#0d141a"
    color_border="fg=#3080d0,bg=#001020"
    color_status="fg=#a0d0ff,bg=#0d141a"
    color_stalft="fg=#5080b0,bg=#0d141a"
    color_starft="fg=#a0d0ff,bg=#0d141a"
    color_stawnf="fg=#6080a0,bg=#0d141a"
    color_stawfc="fg=#5080b0,bg=#0d141a"
  elif [[ $cmd =~ fish ]]; then
    color_window="fg=#b08050,bg=#1a140d"
    color_border="fg=#d08030,bg=#201000"
    color_status="fg=#ffd0a0,bg=#1a140d"
    color_stalft="fg=#b08050,bg=#1a140d"
    color_starft="fg=#ffd0a0,bg=#1a140d"
    color_stawnf="fg=#a08060,bg=#1a140d"
    color_stawfc="fg=#b08050,bg=#1a140d"
  else
    color_window="fg=#b0b0b0,bg=#101010"
    color_border="fg=#d0d0d0,bg=#101010"
    color_status="fg=#d0d0d0,bg=#101010"
    color_stalft="fg=#808080,bg=#101010"
    color_starft="fg=#d0d0d0,bg=#101010"
    color_stawnf="fg=#b0b0b0,bg=#101010"
    color_stawfc="fg=#b0b0b0,bg=#101010"
  fi

# set color
  tmux set -g  window-active-style          "$color_window"
  tmux set -g  pane-active-border-style     "$color_border"
  tmux set -g  status-style                 "$color_status"
  tmux set -g  status-left-style            "$color_stalft"
  tmux set -g  status-right-style           "$color_starft"
  tmux set -g  window-status-style          "$color_stawnf"
  tmux set -g  window-status-current-style  "$color_stawfc"


# read  -p "..."


