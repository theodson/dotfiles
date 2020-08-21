# pure prompt
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# brew autocompletions
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"

  autoload -Uz compinit
  compinit
fi

# z: jump around
# https://github.com/rupa/z/
source "$(brew --prefix)/etc/profile.d/z.sh"

# sqlite
# https://formulae.brew.sh/formula/sqlite#default
export PATH="$(brew --prefix)/opt/sqlite/bin:$PATH"
alias sqlite="sqlite3"

# GNU findutils
# https://formulae.brew.sh/formula/findutils#default
PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# GNU coreutils
# https://formulae.brew.sh/formula/coreutils#default
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# GNU sed
# https://formulae.brew.sh/formula/gnu-sed#default
PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

# GNU which
# https://formulae.brew.sh/formula/gnu-which#default
PATH="$(brew --prefix)/opt/gnu-which/libexec/gnubin:$PATH"

# fzf
# https://github.com/junegunn/fzf
source ~/.fzf.zsh


VALET_PARKED_DIRECTORY=$HOME/Sites

# Open in web browser
# If you are within a subdirectory of the Laravel Valet parked directory
# open the site in the browser, otherwise just open the browser. Examples:
# ~/Sites/timacdonald opens timacdonald.test
# ~/Sites/docs opens docs.test
# ~/Sites/docs/node_modules opens docs.test
browse() {
    domain=$(echo $PWD | sed "s=$VALET_PARKED_DIRECTORY==I" | sed 's=/.*==')

    if [ ${#domain} -gt 0 ];
    then
        open http://$domain.test
    else
        open -a Firefox\ Developer\ Edition
    fi
}

# Open browser
# alias browse=""
