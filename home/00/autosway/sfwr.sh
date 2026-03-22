#!/usr/bin/env bash


fcitx5 &

/usr/lib/xdg-desktop-portal-termfilechooser -r &

tmux source ~/.config/tmux/tmux.conf


