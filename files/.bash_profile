#!/usr/bin/env bash

[ -r ~/.bashrc ] && source ~/.bashrc # all bash setup in bashrc

#
#   https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
#   https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
