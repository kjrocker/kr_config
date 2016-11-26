#!/bin/bash

checkdisplay() { if [ ! -s $DISPLAY ]; then true; else false; fi; }

HOME="/home/$USER"
THIS_FOLDER=`dirname $(realpath $0)`
X_INSTALLED=`checkdisplay`

echo -e "Due to all the package installations, this script will prompt for your password multiple times."

# ${THIS_FOLDER}/scripts/install_packages.sh $HOME $THIS_FOLDER $X_INSTALLED
${THIS_FOLDER}/scripts/add_github_key.sh "${HOME}/.ssh"
# ${THIS_FOLDER}/scripts/install_links.sh $HOME ${THIS_FOLDER}/config
# ${THIS_FOLDER}/scripts/set_other_options.sh
