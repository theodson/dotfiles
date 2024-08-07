#!/usr/bin/env bash

[ -r ~/.bashrc ] && source ~/.bashrc # all bash setup in bashrc

#
#   https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
#   https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#

# call herdUnloadENV as Laravel Herd appends its setup to .bashrc when Herd is rherdUnloadENV
# we want to opt into "herd" as and when required otherwise it breaks our "delicate" valet and php-7.0 setup.
type -p herdUnloadENV && herdUnloadENV
