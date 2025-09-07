# TMUX config, terminal multiplexer.
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2023.05.15


pts=$( tmux display -p '#{pane_tty}' )
cmd=$( ps -o comm= -t $pts \
  | grep -Ev 'less' \
  | tail -n 1 )


if [[ $cmd =~ 'vi' || $cmd =~ 'ya' ]]; then
  # tmux display ' key, vi & ra '
  tmux source ~/.config/tmux/keymap/unctrl.tmx
else
  tmux source ~/.config/tmux/keymap/ctrl.tmx
fi


# read  -p '...'


