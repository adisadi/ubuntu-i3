
#!/bin/bash
#https://lottalinuxlinks.com/how-to-build-and-install-i3-gaps-on-debian/
if ! command -v i3 &> /dev/null
then
    sudo apt-get -y install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev
    git clone https://github.com/Airblader/i3  $HOME/i3-gaps
    cd  $HOME/i3-gaps
    mkdir -p build && cd build
    meson --prefix /usr/local
    ninja
    sudo ninja install
    rm -rf $HOME/i3-gaps
fi
