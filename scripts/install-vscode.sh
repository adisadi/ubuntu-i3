#!/bin/bash
if ! command -v code &> /dev/null
then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > $HOME/packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 $HOME/packages.microsoft.gpg /etc/apt/keyrings
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f $HOME/packages.microsoft.gpg
    sudo apt-get -y install apt-transport-https
    sudo apt-get -y update
    sudo apt-get -y install code
fi 