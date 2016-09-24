#!/bin/bash

REPO_PATH="/home/kevin/.config/kr_config"

case "$1" in
  help )
    echo "Supported optional arguments include: xmonad"
    exit
    ;;
  xmonad )
    ln -s ${REPO_PATH}/xmobar_rc /home/kevin/.xmobarrc
    ln -s ${REPO_PATH}/xmonad.hs /home/kevin/.xmonad/xmonad.hs
    ;;
  openbox )
    echo "No openbox config files under git at this time."
    ;;
esac

ln -s ${REPO_PATH}/bashrc /home/kevin/.bashrc
ln -s ${REPO_PATH}/git-completion.bash /home/kevin/.git-completion.bash
ln -s ${REPO_PATH}/git-prompt.sh /home/kevin/.git-prompt.sh
ln -s ${REPO_PATH}/git_config /home/kevin/.gitconfig
