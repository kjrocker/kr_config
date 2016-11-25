#!/bin/bash

read -p "Enter your github email address: " GIT_EMAIL
read -ps "Enter your github password: " GIT_PASS
SSH_DIR=$1/.ssh
ssh-keygen -q -t rsa -b 4096 -N "" -C $GIT_EMAIL -f ${SSH_DIR}/github
echo -e "HOST github.com\n HOSTNAME github.com\n IdentityFile ~/.ssh/github" >> ${SSH_DIR}/config

PUBLIC_KEY=${SSH_DIR}/github.pub
DATA="{\"title\":\"`hostname`_`date +%Y%m%d`\",\"key\":\"`cat $PUBLIC_KEY`\"}"

curl -u "$GIT_EMAIL:$GIT_PASS" --data $DATA https://api.github.com/user/keys
