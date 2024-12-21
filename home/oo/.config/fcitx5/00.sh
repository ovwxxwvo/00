#!/usr/bin/env bash


cd /home/config/home/oo/.local/share/
ln -sf  ../../.config/fcitx5  ./

cd /home/config/home/oo/.config/fcitx5/themes
ln -sf  ./misty.fcitx5/misty            ./
ln -sf  ./misty.fcitx5/misty-blueberry  ./
ln -sf  ./misty.fcitx5/misty-carambola  ./
ln -sf  ./misty.fcitx5/misty-grape      ./
ln -sf  ./misty.fcitx5/misty-lemon      ./
ln -sf  ./misty.fcitx5/misty-orange     ./
ln -sf  ./misty.fcitx5/misty-peach      ./
ln -sf  ./misty.fcitx5/misty-seagreen   ./
ln -sf  ./misty.fcitx5/misty-skyblue    ./

