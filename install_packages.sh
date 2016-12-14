#!/bin/bash

. ./.constants.sh

sudo cp ${THIS_FOLDER}/config/custom_repos /etc/apt/sources.list.d/docker_and_enpass.list
wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Package maintenance and installing CLI-only additions
sudo apt-get -q -y update
sudo apt-get -q -y upgrade

sudo apt-get -q -y install apt-transport-https ca-certificates build-essential \
libssl-dev gvfs-bin tig xclip sshfs tmux

# Install NVM, RVM, Rails, and Node
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
curl -sSL https://get.rvm.io | bash -s stable --rails

NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node

function install_atom {
  wget -q https://atom.io/download/deb
  mv deb $1
  sudo dpkg --install $1
  rm $1
}

# Install GUI applications if we found an X installation
if $X_INSTALLED ; then
  sudo apt-get install chromium enpass gitk git-gui
  cd ${HOME} && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  install_atom atom-amd64.deb

  apm install sync_settings
fi
