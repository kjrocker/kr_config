#!/bin/bash

read -p "Enter your github email address: " GIT_EMAIL
read -ps "Enter your github password: " GIT_PASS
ssh-keygen -q -t rsa -b 4096 -N "" -C $GIT_EMAIL -f $1/.ssh/github
echo -e "HOST github.com\n HOSTNAME github.com\n IdentityFile ~/.ssh/github" >> $1/.ssh/config

PUBLIC_KEY=$1/.ssh/github.pub
DATA="{\"title\":\"`hostname`_`date +%Y%m%d`\",\"key\":\"`cat $PUBLIC_KEY`\"}"

curl -u "$GIT_EMAIL:$GIT_PASS" --data $DATA https://api.github.com/user/keys
