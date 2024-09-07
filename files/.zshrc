BREW_PREFIX=$(brew --prefix)

# brew shared bin
export PATH="/usr/local/sbin:$PATH"

# sqlite
# https://formulae.brew.sh/formula/sqlite
export PATH="$BREW_PREFIX/opt/sqlite/bin:$PATH"

# GNU findutils
# https://formulae.brew.sh/formula/findutils
export PATH="$BREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"

# GNU grep
# https://formulae.brew.sh/formula/grep
export PATH="$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH"

# GNU coreutils
# https://formulae.brew.sh/formula/coreutils
export PATH="$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"

# GNU sed
# https://formulae.brew.sh/formula/gnu-sed
export PATH="$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"

# GNU which
# https://formulae.brew.sh/formula/gnu-which
export PATH="$BREW_PREFIX/opt/gnu-which/libexec/gnubin:$PATH"

# Java
# https://formulae.brew.sh/formula/openjdk
export PATH="$BREW_PREFIX/opt/openjdk/bin:$PATH"

# composer
# https://formulae.brew.sh/formula/composer
export PATH="\$HOME/.composer/vendor/bin:$PATH"

# locally installed composer install binaries
# https://twitter.com/paulredmond/status/1189952205182226432
export PATH="./vendor/bin:$PATH"


# brew autocompletions
# https://docs.brew.sh/Shell-Completion
export FPATH="$BREW_PREFIX/share/zsh/site-functions:$FPATH"

# Use the terminal to enter GPG passphrase
export GPG_TTY=$(tty)

# Use Dracula for the syntax highlighting theme
export BAT_THEME="Dracula"

# VIM, not nano
export VISUAL=vim
export EDITOR="$VISUAL"

# use 'fd' instead of 'find' for fzf file lookup
export FZF_DEFAULT_COMMAND="fd --type file --follow --no-ignore --hidden --exclude .git"

alias cat="bat"
alias sqlite="sqlite3"
alias ":q"="exit"
alias c="composer"
alias a="php artisan"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"

# Open in web browser
browse() {
    domain=$(echo $PWD | sed "s=$HOME/Code==I" | sed "s=/.*==")
    if [ ${#domain} -gt 0 ];
    then
        open http://$domain.test
    else
        open -a Firefox\ Developer\ Edition
    fi
}


export NVM_DIR="/Users/theodickinson/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP binary.
export PATH="/Users/theodickinson/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/theodickinson/Library/Application Support/Herd/config/php/81/"



# Zsh autocompletions
# https://github.com/zsh-users/zsh-autosuggestions
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^e' autosuggest-execute
bindkey '^y' autosuggest-accept

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

# fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# "cd" by typing only the directory
setopt autocd

# Setup completions
autoload -Uz compinit
compinit

# Set pure prompt
autoload -U promptinit; promptinit
prompt pure

