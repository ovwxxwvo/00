# TMUX config, terminal multiplexer.
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2023.05.15


# get var
  pts=$( tmux display-message -p '#{pane_tty}' )
  cmd=$( ps -o comm= -t $pts \
    | grep -Ev 'less|xclip|ueberzug' \
    | tail -n 1 )

# let, vi & ra get their own key
  if [[ $cmd =~ 'vi' || $cmd =~ 'jo' ]]; then
    # tmux display ' key, vi & ra '
    tmux source ~/.config/tmux/key/unctrl.tmx
    tmux source ~/.config/tmux/key/redo.tmx
  else
    tmux source ~/.config/tmux/key/ctrl.tmx
  fi


# read  -p '...'


