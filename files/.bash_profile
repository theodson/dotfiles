# Navigation
shopt -s autocd
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

PATH="$HOME/.git-commands:$PATH"

op() {
    cd ~/code

    directory=$(ls | fzf -q "$1")

    cd $directory

    vim
}

# use fd instead of find for fzf file lookup
export FZF_DEFAULT_COMMAND='fd --type file --follow --no-ignore --hidden --exclude .git'

# Path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="~/.composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# visuals
export PS1="~ \W "
alias cat="bat"
export BAT_THEME="Dracula"

# git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export GIT_PROMPT_ONLY_IN_REPO=1
  export GIT_PROMPT_FETCH_REMOTE_STATUS=0
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# ?
export GPG_TTY=$(tty)

