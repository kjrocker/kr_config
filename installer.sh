#!/bin/bash

HOME="/home/$USER"
THIS_FOLDER=`dirname $(realpath $0)`
X_INSTALLED=`$(which X &> /dev/null && 1 || 0) -eq 0`

${THIS_FOLDER}/scripts/install_packages.sh $HOME $X_INSTALLED
${THIS_FOLDER}/scripts/add_github_key.sh $HOME
${THIS_FOLDER}/scripts/install_links.sh $HOME ${THIS_FOLDER}/config
${THIS_FOLDER}/scripts/set_other_options.sh
