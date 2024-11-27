#!/usr/bin/env bash

[ -r ~/.bashrc ] && source ~/.bashrc # all bash setup in bashrc

#
#   https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
#   https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source ~/.orbstack/shell/init.bash 2>/dev/null || :


# Herd injected NVM configuration (always automatically added by Herd to .bash_profile)
export NVM_DIR="/Users/theodickinson/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ ! -e "$NVM_DIR" ]; then
    unset NVM_DIR
fi

# Node Version Manager - Auto Complete
if test ! -z "${NVM_DIR}"; then
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

