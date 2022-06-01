#!/usr/bin/env bash

VSCODE_BASHRC="/home/vscode/.bashrc"
ROOT_BASHRC="/root/.bashrc"

LL_COMMAND="alias ll='ls -l'"
LA_COMMAND="alias la='ls -A'"
L_COMMAND="alias l='ls -CF'"

sed -i -e "s/#${LL_COMMAND}/${LL_COMMAND}/g" $VSCODE_BASHRC
sed -i -e "s/#${LA_COMMAND}/${LA_COMMAND}/g" $VSCODE_BASHRC
sed -i -e "s/#${L_COMMAND}/${L_COMMAND}/g" $VSCODE_BASHRC

echo $LL_COMMAND >> $ROOT_BASHRC
echo $LA_COMMAND >> $ROOT_BASHRC
echo $L_COMMAND >> $ROOT_BASHRC
