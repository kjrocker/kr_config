#!/bin/bash

HOME="/home/kevin"

REPO_PATH="${HOME}/.config/kr_config"

case "$1" in
  help )
    echo "Supported optional arguments include: xmonad"
    exit
    ;;
  xmonad )
    ln -s ${REPO_PATH}/xmobar_rc ${HOME}/.xmobarrc
    ln -s ${REPO_PATH}/xmonad.hs ${HOME}/.xmonad/xmonad.hs
    ;;
  openbox )
    echo "No openbox config files under git at this time."
    ;;
esac

ln -s ${REPO_PATH}/bashrc ${HOME}/.bashrc
ln -s ${REPO_PATH}/git-completion.bash ${HOME}/.git-completion.bash
ln -s ${REPO_PATH}/git-prompt.sh ${HOME}/.git-prompt.sh
ln -s ${REPO_PATH}/git_config ${HOME}/.gitconfig
