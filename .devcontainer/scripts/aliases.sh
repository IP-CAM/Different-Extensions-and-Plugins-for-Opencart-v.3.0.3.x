#!/usr/bin/env bash

BASHRC="/home/vscode/.bashrc"
sed -i -e "s/#alias ll='ls -l'/alias ll='ls -l'/g" $BASHRC
sed -i -e "s/#alias la='ls -A'/alias la='ls -A'/g" $BASHRC
sed -i -e "s/#alias l='ls -CF'/alias l='ls -CF'/g" $BASHRC
