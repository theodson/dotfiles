#!/usr/bin/env bash

# ! Important behaviour when entering folders - see function 'enter_directory' in .functions
BREW_PREFIX=$(brew --prefix)
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # $HOME
BASEDIR="$(dirname $(realpath "${BASH_SOURCE[0]}"))" # dotfiles directory
echo "BASEDIR=$BASEDIR"
#
# https://scriptingosx.com/2017/04/about-bash_profile-and-bashrc-on-macos/
# https://books.apple.com/book/moving-to-zsh/id1483591353
#
# Standardising on $HOME.bashrc over $HOME/.profile as $HOME/.bash_profile makes $HOME/.profile obsolete and ignores it
#

# Mcfly - https://github.com/cantino/mcfly
type mcfly &>/dev/null && eval "$(mcfly init bash)"
export MCFLY_RESULTS_SORT=LAST_RUN # LAST_RUN|RANK
export MCFLY_RESULTS=65535 # max is 65535
# Undocumented MCFLY_RESULTS_FILTER https://github.com/cantino/mcfly/blob/a7722aed500e5a93922061c5f64cda682460daad/src/settings.rs#L264
export MCFLY_RESULTS_FILTER=CURRENT_DIRECTORY  #GLOBAL|CURRENT_DIRECTORY

# Starship - easy command prompt
type starship &>/dev/null && eval "$(starship init bash)"
# starship generates a PROMPT_COMMAND, append our enter_directory function to it
if test -z "$PROMPT_COMMAND"; then
    export PROMPT_COMMAND="enter_directory"
fi
if ! echo "$PROMPT_COMMAND" | grep 'enter_directory'; then # add enter_directory once.
    export PROMPT_COMMAND="$PROMPT_COMMAND; enter_directory"
fi

USE_SWITCH_PHP_HACKERY='yes use switch_php script (pre OrbStack and Herd adoption 2024-SEPT)'
unset USE_SWITCH_PHP_HACKERY # Herd and OrbStack only...

[ -r $BASEDIR/.versions ] && source $BASEDIR/.versions || true
[ -r $BASEDIR/.credentials ] && source $BASEDIR/.credentials || true
[ -r $BASEDIR/.profile ] && source $BASEDIR/.profile || true
[ -r $BASEDIR/.bash/.functions ] && source $BASEDIR/.bash/.functions || true
[ -r $BASEDIR/postgres ] && source $BASEDIR/postgres || echo "No postgres script"
[ -r $BASEDIR/.bash/.exports ] && source $BASEDIR/.bash/.exports || true
[ -r $BASEDIR/.bash/.aliases ] && source $BASEDIR/.bash/.aliases || true
#[ -r $BASEDIR/.ps1 ] && [[ ! "$PROMPT_COMMAND" =~ starship ]] && source $BASEDIR/.ps1 || true # start aware prompt
[ -r $BASEDIR/switch_php ] && [ -n "$USE_SWITCH_PHP_HACKERY" ] && source $BASEDIR/switch_php || true
[ -r $HOME/.adhoc ] && source $HOME/.adhoc || true

# Add folder to search PATH if it exists
for folder in $COMPOSER_HOME $HOME/.yarn/bin $HOME/bin /usr/local/bin /usr/local/sbin;
do
	if test -e "${folder}"; then
		echo $PATH | grep "$folder" &>/dev/null && true || export PATH="$PATH:$folder" # add path later in seach path if missing
	fi
done

# Jave Env - http://www.jenv.be/ - install multiple java environments
if type -t jenv &>/dev/null; then
	eval "$(jenv init -)" && echo -n "jenv init done. " && jenv enable-plugin export || echo "jenv failed to initialise"
fi

# Python Versions - https://github.com/pyenv/pyenv
if test -r "$PYENV_ROOT"; then
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"|| echo "pyenv failed to initialise"
fi

if ! type python -V &>/dev/null; then
    echo "No python found... installing latest version of Python"
    pythonVersion=3.12.2
    yes y | pyenv install "$pythonVersion" && pyenv global "$pythonVersion"
fi

# Ruby Env - Override default macOs Ruby with Brew's version.
export PATH="/usr/local/opt/ruby/bin:$PATH"
if eval false; then
    ## For compilers to find ruby you may need to set:
    export LDFLAGS="-L/usr/local/opt/ruby/lib"
    export CPPFLAGS="-I/usr/local/opt/ruby/include"
    ## For pkg-config to find ruby you may need to set:
    export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
fi

# Node Version Manager - Auto Complete
# Duplicated NVM setup but required when using `herd node_isolate` as that command isn't aware of .bash_profile setup (even though it populates it!)!
export NVM_DIR="${NVM_DIR:-/Users/theodickinson/Library/Application Support/Herd/config/nvm}" # default to Herd's NVM if not set.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
if test ! -z "${NVM_DIR}"; then
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

# ===========================================================================
#		Auto Complete

# Bash Auto Complete
# bash v3 on mac doesnt support nosort option - lets ignore it https://rakhesh.com/mac/bash-complete-nosort-invalid-option-name/
[ ! -f /usr/local/etc/bash_completion ] && echo -e "missing bash-completion, try\n\tbrew install bash-completion"
# install brew bash (v5) and nosort is supported.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion 2>&1  | sed '/^$/d'
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && source "/usr/local/etc/profile.d/bash_completion.sh" | sed '/^$/d'

SECRETS_PATH=

export PATH="/$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"
