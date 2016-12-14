#!/bin/bash

. ./.constants.sh

read -e -p "Enter your github email address and press [ENTER]: " GIT_EMAIL
read -e -p "Enter your github password and press [ENTER]: " GIT_PASS

echo "Testing start..."
echo "$GIT_EMAIL:$GIT_PASS"
echo "Testing end..."

mkdir $HOME/.ssh > /dev/null

ssh-keygen -q -t rsa -b 4096 -N "" -C $GIT_EMAIL -f $HOME/.ssh/github
echo -e "HOST github.com\n HOSTNAME github.com\n IdentityFile ~/.ssh/github" >> $HOME/.ssh/config

PUBLIC_KEY="$(cat $HOME/.ssh/github.pub)"
TITLE="$(hostname)_$(date +%Y%m%d)"

DATA="{\"title\":\"${TITLE}\",\"key\":\"${PUBLIC_KEY}\"}"

curl -u "$GIT_EMAIL:$GIT_PASS" --data $DATA https://api.github.com/user/keys
