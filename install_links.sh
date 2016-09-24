#!/bin/bash

REPO_PATH="~/.config/kr_config"

ln -s ${REPO_PATH}/bashrc ~/.bashrc
ln -s ${REPO_PATH}/git-completion.bash ~/.git-completion.bash
ln -s ${REPO_PATH}/git-prompt.sh ~/.git-prompt.sh
ln -s ${REPO_PATH}/git_config ~/.gitconfig

ln -s ${REPO_PATH}/xmobar_rc ~/.xmobarrc
ln -s ${REPO_PATH}/xmonad.hs ~/.xmonad/xmonad.hs
