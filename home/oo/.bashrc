# BASH config,


# source /home/00/autoload.sh

# LANG=zh_CN.UTF-8
# LANGUAGE=zh_CN:en_US

# export TERMEMUL=$TERM
[ $TERM == 'linux' ] && export TERM='fbterm'
[[ $(tty) == \/dev\/tty[2-4]* ]] && fbterm -i fcitx5-fbterm
[[ $(tty) == \/dev\/tty[2-6]* ]] && export TERM='linux'


