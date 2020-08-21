op() {
    cd ~/code

    local directory=$(ls | fzf --ansi -q "$1")

    cd $directory

    vim
}


# ?
export GPG_TTY=$(tty)

