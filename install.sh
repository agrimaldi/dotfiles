#!/usr/bin/env bash

CWD=$(pwd)
LN="ln -s -f"

echo "Linking ssh config file"
${LN} ${CWD}/dotfiles/sshconfig ~/.ssh/config

echo "Linking git config file"
${LN} ${CWD}/dotfiles/gitconfig ~/.gitconfig
