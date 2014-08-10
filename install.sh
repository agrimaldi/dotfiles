#!/usr/bin/env bash

CWD=$(pwd)

echo "Linking ssh config file"
ln -s ${CWD}/dotfiles/sshconfig ~/.ssh/config

echo "Linking git config file"
ln -s ${CWD}/dotfiles/gitconfig ~/.gitconfig
