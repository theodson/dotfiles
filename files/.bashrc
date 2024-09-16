#!/usr/bin/env bash

# ! Important behaviour when entering folders - see function 'enter_directory' in .functions

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # $HOME

#
# https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
# https://books.apple.com/book/moving-to-zsh/id1483591353
#
# Standardising on $HOME.bashrc over $HOME/.profile as $HOME/.bash_profile makes $HOME/.profile obsolete and ignores it
#


# Mcfly - https://github.com/cantino/mcfly
type mcfly &>/dev/null && eval "$(mcfly init bash)"

# Starship - easy command prompt
eval "$(starship init bash)"
# starship generates a PROMPT_COMMAND, append our enter_directory function to it
if ! echo "$PROMPT_COMMAND" | grep 'enter_directory'; then # add enter_directory once.
    export PROMPT_COMMAND="$PROMPT_COMMAND; enter_directory"
fi

USE_SWITCH_PHP_HACKERY='yes use switch_php script (pre OrbStack and Herd adoption 2024-SEPT)'
unset USE_SWITCH_PHP_HACKERY # Herd and OrbStack only...

[ -r $BASEDIR/.versions ] && source $BASEDIR/.versions || true
[ -r $BASEDIR/.credentials ] && source $BASEDIR/.credentials || true
[ -r $BASEDIR/.profile ] && source $BASEDIR/.profile || true
[ -r $BASEDIR/.functions ] && source $BASEDIR/.functions || true
[ -r $BASEDIR/dotfiles/files/postgres ] && source $BASEDIR/dotfiles/files/postgres || echo "No postgres" true
[ -r $BASEDIR/.exports ] && source $BASEDIR/.exports || true
[ -r $BASEDIR/.aliases ] && source $BASEDIR/.aliases || true
[ -r $BASEDIR/.ps1 ] && [[ ! "$PROMPT_COMMAND" =~ starship ]] && source $BASEDIR/.ps1 || true # start aware prompt
[ -r $BASEDIR/dotfiles/files/switch_php ] && [ -n "$USE_SWITCH_PHP_HACKERY" ] && source $BASEDIR/dotfiles/files/switch_php || true
[ -r $BASEDIR/.adhoc ] && source $BASEDIR/.adhoc || true

# Add folder to search PATH if it exists
for folder in $COMPOSER_HOME $HOME/.yarn/bin $HOME/bin /usr/local/bin /usr/local/sbin; do
    if test -e "${folder}"; then
        echo $PATH | grep "$folder" &>/dev/null && true || export PATH="$PATH:$folder" # add path later in seach path if missing
    fi
done

# Node Version Manager
if test -s "/usr/local/opt/nvm/nvm.sh"; then
    mkdir -p "${NVM_HOME:-$HOME/.nvm}" || true
    source "/usr/local/opt/nvm/nvm.sh" # This loads nvm

    if test -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm"; then
        source "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
    fi
fi

# Jave Env - http://www.jenv.be/ - install multiple java environments
if test -r "$HOME/.jenv"; then
    eval "$(jenv init -)" || echo "jenv failed to initialise"
fi

# Python Versions - https://github.com/pyenv/pyenv
if test -r "$PYENV_ROOT"; then
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)" || echo "pyenv failed to initialise"
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

# Bash Auto Complete
# bash v3 on mac doesnt support nosort option - lets ignore it https://rakhesh.com/mac/bash-complete-nosort-invalid-option-name/
[ ! -f /usr/local/etc/bash_completion ] && echo -e "missing bash-completion, try\n\tbrew install bash-completion"
# install brew bash (v5) and nosort is supported.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion 2>&1  | sed '/^$/d'
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh" | sed '/^$/d'

# Node Version Manager - Auto Complete
if test ! -z "${NVM_DIR}"; then
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

if [ -n "$USE_SWITCH_PHP_HACKERY" ]; then
    # when USE_SWITCH_PHP_HACKERY we adapt Herd to work with the switch_php commands.
    echo 'USE_SWITCH_PHP_HACKERY'

    export PRE_HERD_NVM_DIR="$NVM_DIR"
    export PRE_HERD_PATH="$PATH"
    export HERD_BIN="$HOME/Library/Application Support/Herd/bin/"
    export HERD_NVM="$HOME/Library/Application Support/Herd/config/nvm"

    function herdLoadEnv() {
        # these line items get installed by Herd into .bash_profile and interfere with our attempts to support
        # older versions of PHP (7.0) and Laravel Valet (3.x - not 4.x).

        # Herd injected NVM configuration
        # export NVM_DIR="$HERD_NVM"
        export NVM_DIR="$HERD_NVM"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

        # Herd injected PHP binary.
        # export PATH="/Users/theodickinson/Library/Application Support/Herd/bin/":$PATH
        export PATH="$HERD_BIN":$PATH

        # Herd injected PHP 8.3 configuration.
        export HERD_PHP_83_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/83/"

        # Herd injected PHP 7.4 configuration.
        export HERD_PHP_74_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/74/"
    }

    function herdUnloadENV() {
        export PATH=$(echo $PATH | sed "s#$HERD_BIN##")
        [ -n "$PRE_HERD_NVM_DIR" ] && export NVM_DIR="$PRE_HERD_NVM_DIR"
        [ -n "$PRE_HERD_PATH" ] && export PATH="$PRE_HERD_PATH"
    }

fi
