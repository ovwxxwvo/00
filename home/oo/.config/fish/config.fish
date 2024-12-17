# FISH config, the friendly interactive shell.
# Maintainer:	 Jessee Chan <CYPHER0@foxmail.com>
# Last Change: 2024.11.20


source  /home/00/autoshll.sh


set  config  "$HOME/.config/fish"
source $config/basic.fsh

set  keymap  "$HOME/.config/fish/keymap"
source $keymap/ctrl.fsh
source $keymap/copy.fsh

set  plugin  "$HOME/.config/fish/plugins"
source $plugin/misty.fish/init.fish


