#!/bin/bash

function create_link {
  \rm -f $1
  \ln -s $2 $1
}

create_link $1/.bashrc $2/bashrc
create_link $1/.git-completion.bash $2/git-completion.bash
create_link $1/.git-prompt.sh $2/git-prompt.sh
create_link $1/.gitconfig $2/git-config
