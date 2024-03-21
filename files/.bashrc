#!/usr/bin/env bash

# ! Important behaviour when entering folders - see function 'enter_directory' in .functions

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # $HOME

#
# https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
# https://books.apple.com/book/moving-to-zsh/id1483591353
#
# Standardising on $HOME.bashrc over $HOME/.profile as $HOME/.bash_profile makes $HOME/.profile obsolete and ignores it
#

[ -r $BASEDIR/.versions ] && source $BASEDIR/.versions || true
[ -r $BASEDIR/.credentials ] && source $BASEDIR/.credentials || true
[ -r $BASEDIR/.profile ] && source $BASEDIR/.profile || true
[ -r $BASEDIR/.functions ] && source $BASEDIR/.functions || true
[ -r $BASEDIR/.exports ] && source $BASEDIR/.exports || true
[ -r $BASEDIR/.aliases ] && source $BASEDIR/.aliases || true
[ -r $BASEDIR/.ps1 ] && source $BASEDIR/.ps1 || true # start aware prompt
[ -r $BASEDIR/dotfiles/files/switch_php ] && source $BASEDIR/dotfiles/files/switch_php || true
[ -r $BASEDIR/.adhoc ] && source $BASEDIR/.adhoc || true


# Add folder to search PATH if it exists
for folder in $COMPOSER_HOME $HOME/.yarn/bin $HOME/bin /usr/local/bin /usr/local/sbin;
do
	if test -e "${folder}"; then
		echo $PATH | grep "$folder" &>/dev/null && true || export PATH="$PATH:$folder" # add path later in seach path if missing
	fi
done


# Node Version Manager
if test -s "/usr/local/opt/nvm/nvm.sh"; then
    mkdir -p "${NVM_HOME:-$HOME/.nvm}" || true
    source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

    if test -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm"; then
        source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    fi
fi

# Jave Env - http://www.jenv.be/ - install multiple java environments
if test -r "$HOME/.jenv"; then
	eval "$(jenv init -)" || echo "jenv failed to initialise"
fi

# Override default macOs Ruby with Brew's version.
export PATH="/usr/local/opt/ruby/bin:$PATH"
if eval false; then
    ## For compilers to find ruby you may need to set:
    export LDFLAGS="-L/usr/local/opt/ruby/lib"
    export CPPFLAGS="-I/usr/local/opt/ruby/include"
    ## For pkg-config to find ruby you may need to set:
    export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
fi


# ===========================================================================
#		Auto Complete

# Twilio Auto Complete
if eval false; then
    [ -f $HOME/.twilio-cli/autocomplete/bash_setup ] && source $HOME/.twilio-cli/autocomplete/bash_setup || true;
fi

# Bash Auto Complete
# bash v3 on mac doesnt support nosort option - lets ignore it https://rakhesh.com/mac/bash-complete-nosort-invalid-option-name/
[ ! -f /usr/local/etc/bash_completion ] && echo -e "missing bash-completion, try\n\tbrew install bash-completion"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion 2>&1 | grep -v 'nosort'
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh" 2>&1 | grep -v 'nosort'

# Node Version Manager - Auto Complete
if test ! -z "${NVM_DIR}"; then
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Mcfly - https://github.com/cantino/mcfly
type mcfly &>/dev/null && eval "$(mcfly init bash)"

eval "$(starship init bash)"

# Herd injected NVM configuration
export NVM_DIR="/Users/theodickinson/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/83/"

# Herd injected PHP binary.
export PATH="/Users/theodickinson/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/74/"

