# TMUX config, terminal multiplexer.
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2023.05.15


# get var
  pts=$( tmux display-message -p '#{pane_tty}' )
  cmd=$( ps -o comm= -t $pts \
    | grep -Ev 'mpv|findmnt' \
    | tail -n 1 \
    )

  tmux renamew "$cmd"


# read  -p '...'


