#!/usr/bin/env bash
if test -n "$(getconf DARWIN_USER_TEMP_DIR)"; then
    # attempt to fix 2025-SEP issue where /var/folders/zz/zyxvpxvq6csfxvn_n0000000000000/T is not writable for a variety
    # of
    export OLD_TMPDIR="$TMPDIR"
    TMPDIR=$(getconf DARWIN_USER_TEMP_DIR)
    export TMPDIR
fi
HOME="${HOME:-/Users/$(whoami)}"

[ -r "$HOME"/.bashrc ] && source "$HOME"/.bashrc # all bash setup in bashrc

#
#   https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
#   https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
#

# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
source "$HOME"/.orbstack/shell/init.bash 2>/dev/null || :


# Herd injected NVM configuration (always automatically added by Herd to .bash_profile)
export NVM_DIR="$HOME/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if [ ! -e "$NVM_DIR" ]; then
    unset NVM_DIR
fi

# Node Version Manager - Auto Complete
if test ! -z "${NVM_DIR}"; then
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/74/"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/81/"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.5 configuration.
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"


# Herd injected PHP binary.
export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source $HOME/.orbstack/shell/init.bash 2>/dev/null || :

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Junie
export PATH="$HOME/.local/bin:$PATH"
# End of Junie
