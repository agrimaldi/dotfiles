#!/usr/bin/env bash

CWD=$(pwd)

for dotfile in ./dotfiles/*
do
    dotfname=${dotfile##*/}
    echo "Linking ${dotfname}"
    ln -s "$CWD/dotfiles/${dotfname}" ~/."${dotfname}"
done
