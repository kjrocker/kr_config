
# Overview

A shell script I've developed to streamline configuration of new Debian-based systems.

Installs from a single command, shown below.
```
\curl -o- https://raw.githubusercontent.com/krocker34/kr_config/master/initializer.sh | bash
```
The initalizer downloads the repo and passes off to the actual installation script.

If you've already cloned the repo, just run `./installer.sh`

# Contents

* Installs a few packages I will always want
* Sets up various configuration files.
* Adds a github SSH key
