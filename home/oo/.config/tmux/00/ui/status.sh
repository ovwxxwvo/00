# TMUX config, terminal multiplexer.
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2023.05.15


# get var
  ssn_id=$( \
    tmux display-message -p '#{session_id}' \
    |awk -F"[\t \$]+" '{print $2}' \
    )
  win_nm=$( \
    tmux list-session \
    |grep -E "^$ssn_id" \
    |awk -F"[\t ]+" '{print $2}' \
    )
  # echo $win_nm

# set status
  if [[ $win_nm -gt 1 ]]; then
    tmux set -g status on
  else
    tmux set -g status off
  fi


# read  -p '...'


