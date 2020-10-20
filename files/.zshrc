BREW_PREFIX=$(brew --prefix)
VALET_TLD="test"
VALET_PARKED_DIRECTORY="$HOME/Code/"

# "cd" by typing only the directory
setopt autocd

# pure prompt
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# brew shared bin
export PATH="/usr/local/sbin:$PATH"

# brew autocompletions
# https://docs.brew.sh/Shell-Completion
export FPATH="$BREW_PREFIX/share/zsh/site-functions:$FPATH"
autoload -Uz compinit
compinit

# Zsh syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Command substring search (up / down arrows)
# https://github.com/zsh-users/zsh-history-substring-search
source "$BREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

# z: jump around
# https://github.com/rupa/z/
source "$BREW_PREFIX/etc/profile.d/z.sh"

# sqlite
# https://formulae.brew.sh/formula/sqlite#default
export PATH="$BREW_PREFIX/opt/sqlite/bin:$PATH"
alias sqlite="sqlite3"

# GNU findutils
# https://formulae.brew.sh/formula/findutils#default
export PATH="$BREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"

# GNU coreutils
# https://formulae.brew.sh/formula/coreutils#default
export PATH="$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"

# GNU sed
# https://formulae.brew.sh/formula/gnu-sed#default
export PATH="$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"

# GNU which
# https://formulae.brew.sh/formula/gnu-which#default
export PATH="$BREW_PREFIX/opt/gnu-which/libexec/gnubin:$PATH"

# composer
# https://formulae.brew.sh/formula/composer#default
export PATH="/Users/tim/.composer/vendor/bin:$PATH"

# composer install binaries
# https://twitter.com/paulredmond/status/1189952205182226432
export PATH="./vendor/bin:$PATH"

# artisan commands
alias c="composer"

# artisan commands
alias a="php artisan"

# fzf
# https://github.com/junegunn/fzf
source ~/.fzf.zsh
# use 'fd' instead of 'find' for 'fzf file lookup
export FZF_DEFAULT_COMMAND="fd --type file --follow --no-ignore --hidden --exclude .git"

# bat, not cat 🦇
# https://github.com/sharkdp/bat
alias cat="bat"
export BAT_THEME="Dracula"

# Open in web browser
#
# If you are within a subdirectory of the Laravel Valet parked directory
# open the site in the browser, otherwise just open the browser. Examples:
# ~/Sites/timacdonald opens http://timacdonald.test
# ~/Sites/style-guide opens http://style-guide.test
# ~/Sites/style-guide/node_modules opens http://style-guide.test
browse() {
    domain=$(echo $PWD | sed "s=$VALET_PARKED_DIRECTORY==I" | sed "s=/.*==")
    if [ ${#domain} -gt 0 ];
    then
        open http://$domain.$VALET_TLD
    else
        open -a Firefox\ Developer\ Edition
    fi
}

# A tinker env to play in
play() {
    cd ~/Code/playground

    php artisan tinker
}

# always start in the code directory
cd ~/Code
