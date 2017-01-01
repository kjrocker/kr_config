#!/bin/bash

THIS_FOLDER=`dirname $(realpath $0)`

function create_link {
  \rm -f $1
  \ln -s $2 $1
}

create_link ${HOME}/.bashrc ${THIS_FOLDER}/config/bashrc
create_link ${HOME}/.git-completion.bash ${THIS_FOLDER}/config/git-completion.bash
create_link ${HOME}/.git-prompt.sh ${THIS_FOLDER}/config/git-prompt.sh
create_link ${HOME}/.gitconfig ${THIS_FOLDER}/config/git-config
create_link ${HOME}/.config/openbox/rc.xml ${THIS_FOLDER}/config/openbox_rc.xml
