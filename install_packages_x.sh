#!/bin/bash

THIS_FOLDER=`dirname $(realpath $0)`

# Package maintenance and installing CLI-only additions
sudo apt-get -q -y update
sudo apt-get -q -y upgrade

function install_atom {
  wget -q https://atom.io/download/deb
  mv deb $1
  sudo dpkg --install $1
  rm $1
}

sudo apt-get install chromium enpass gitk git-gui
cd ${HOME} && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
install_atom atom-amd64.deb

apm install sync-settings
