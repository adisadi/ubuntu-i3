#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

#full upgrade
sudo apt-get update -y
sudo apt-get upgrade -y

#install vbguest
sudo apt-get install virtualbox-guest-utils -y

#lang
sudo locale-gen de_CH.UTF-8
sudo update-locale LANG=de_CH.UTF-8

#keyboard
sudo sed -i 's|XKBLAYOUT="us"|XKBLAYOUT="ch"|g' /etc/default/keyboard

# remove ubuntu user
sudo deluser ubuntu --remove-home

#remove packages
sudo apt-get -y purge gnome-terminal byobu vim texinfo info

#remove snapd
sudo systemctl stop snapd
sudo apt-get remove --assume-yes --purge snapd
rm -fr ~/snap
sudo rm -rf /var/cache/snapd/ 
sudo apt-mark hold snapd

#remove apparmor
sudo systemctl stop apparmor
sudo apt-get remove --assume-yes --purge apparmor

#copy scripts
cp -R /vagrant/scripts $HOME
chmod +x $HOME/scripts/*.sh


#build & install i3-gaps
echo "Start build&install i3-gaps"
source $HOME/scripts/build-install-i3-gaps.sh

sudo apt-get -y install \
    xinit \
    i3status \
    fonts-font-awesome \
    slim \
    picom \
    dmenu \
    ranger \
    feh \
    kitty 

#display manager & autologin
sudo sed -i 's|sessiondir            /usr/share/xsessions/|#sessiondir            /usr/share/xsessions/|g' /etc/slim.conf
sudo sed -i 's|#auto_login          no|auto_login          yes|g' /etc/slim.conf
sudo sed -i 's|#default_user        simone|default_user        vagrant|g' /etc/slim.conf
sudo sed -i 's|current_theme       debian-softwaves|current_theme        default|g' /etc/slim.conf

sudo cp /vagrant/.config/wallpapers/default.jpg /usr/share/slim/themes/default/background.jpg
echo 'exec i3' > /home/vagrant/.xsession

#Locale
sudo ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
sudo timedatectl set-local-rtc 0

#add user to virtualbox group
sudo usermod -G vboxsf -a $USER

#install configs
mkdir ~/.config
echo "Coping config files to $HOME/.config/"
cp -R /vagrant/.config/* $HOME/.config/

#chrome install
echo "Start Chrome install"
source $HOME/scripts/install-chrome.sh

#vs code install
echo "Start VS Code install"
source $HOME/scripts/install-vscode.sh

#full upgrade
#sudo apt-get update -y
sudo apt-get dist-upgrade  -y

#clean
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean