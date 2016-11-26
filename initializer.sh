#!/bin/bash

\curl -Ls https://github.com/krocker34/kr_config/tarball/master > config_script.tar.gz
mkdir config_script && tar xmf config_script.tar.gz -C config_script --strip-components 1

sleep 1
./config_script/installer.sh
