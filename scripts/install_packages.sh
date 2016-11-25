#!/bin/bash

sudo su
# Add Enpass and Docker repositories
echo "deb http://repo.sinew.in/ stable main" > \
  /etc/apt/sources.list.d/enpass.list
wget -O - https://dl.sinew.in/keys/enpass-linux.key | apt-key add -

echo "deb https://apt.dockerproject.org/repo debian-jessie main" > \
  /etc/apt/sources.list.d/docker.list
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
exit

# Package maintenance and installing CLI-only additions
sudo apt-get -q update
sudo apt-get -q upgrade
sudo apt-get -q install apt-transport-https ca-certificates build-essential libssl-dev
sudo apt-get -q install git tig xclip sshfs docker-engine tmux

# Install NVM, RVM, Rails, and Node
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
curl -sSL https://get.rvm.io | bash -s stable --rails

NVM_DIR="$1/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node

# Install GUI applications if we found an X installation
if [[ $2 ]]; then
  sudo apt-get install chromium enpass
  curl https://atom.io/download/deb > atom-amd64.deb
  sudo dpkg --install atom-amd64.deb
  rm atom-amd64.deb
  cd $1 && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

  apm install sync_settings
fi
