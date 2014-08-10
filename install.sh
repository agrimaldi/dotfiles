#!/usr/bin/env bash

CWD=$(pwd)
CP="cp -f"

echo "Copying ssh config file"
${CP} ${CWD}/dotfiles/sshconfig ~/.ssh/config

echo "Copying git config file"
${CP} ${CWD}/dotfiles/gitconfig ~/.gitconfig
