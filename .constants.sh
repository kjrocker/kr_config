#!/bin/bash

checkdisplay() { if [ ! -s $DISPLAY ]; then true; else false; fi; }

HOME="/home/$USER"
THIS_FOLDER=`dirname $(realpath $0)`
X_INSTALLED=`checkdisplay`
