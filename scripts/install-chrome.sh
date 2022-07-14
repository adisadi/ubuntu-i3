#!/bin/bash
wget -q -O $HOME/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i $HOME/google-chrome-stable_current_amd64.deb
sudo apt-get -y -f install
rm $HOME/google-chrome-stable_current_amd64.deb