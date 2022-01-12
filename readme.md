# Settings up the new machine

> See **Snapshot - before install or nuking** BEFORE INSTALLING !


### Fork it!
... make it your own! 

Fork this repo and change to your liking... You'll probably want to change these files once forked.

- `dotfiles/files/.gitconfig`
- `dotfiles/files/.Brewfile`

You should compare your generated `$HOME/predotfiles.Brewfile` file with the `dotfiles/files/.Brewfile`

### Install

- Now run the instasllation script
```sh
# change reponame to your forked repo
reponame=theodson

git clone https://github.com/$reponame/dotfiles.git 
bash dotfiles/install
```




- Import GPG key

```sh
gpg —-import /path/to/secret-key-backup.asc
gpg --list-keys
# copy keyid
gpg --edit-key {keyid} trust quit
# trust ultimately
```

- Drop SSH keys into ~/.ssh
- Add SSH key to agent

```
ssh-add -K ~/.ssh/id_ed25519
```




## Snapshot - before install or nuking  🧨 

- Archive list of existing apps installed via brew or App Store
```
brew update

brew bundle dump --file $HOME/predotfiles.Brewfile && echo "Your current brew and AppStore environment is archived here $HOME/predotfiles.Brewfile"

ls /Applications/ > predotfiles.MacAppStore_list
```
- make a copy of existing important configurations in HOME directory
```
tar -czLf $HOME/predotfiles.my-configuration.tar.gz $HOME/{.m2/settings*, .vim,.bash_profile,.bashrc,.profile,.config,.zshrc,.ssh,ssh_config,.netrc,.gnupg,.Brewfile.lock.json} $HOME/predotfiles.Brewfile $HOME/.composer/{composer.json,composer.lock} 2>/dev/null
```
> Important: move these archived files __off machine__ somewhere safe ☁️  e.g. 
>
> ```scp $HOME/predotfiles.my-configuration.tar.gz user@safehost:safeplace```

- unpushed changes / branches / repos 
- Ensure TimeMachine/BackBlaze/etc is recently synced.
- ~~run `mackup backup`~~
- ~~run `restic`~~

# Updating

Re-run the installation script

```
bash dotfiles/install
```

Sometimes this breaks php/valet - see troubleshooting below.



# Troubleshooting

Lets face it, its likely, brew changes and constant WIP...!

## Valet - Php breaks 

If our custom **`switch_php`** fails to work, try this sequence of tasks.

> These functions all exist in `dotfiles/files/switch_php` ( loaded by `.bashrc`)

```
php_uninstall
switch_php 8.1
switch_php 7.0
```



## How to add MacAppStore Apps 

Example search for WhatsApp reveals an MacAppStore ID

```
mas search WhatsApp | head -1

1147396723  WhatsApp Desktop                          (2.2147.16)
```

Which can be represented as a `mas` entry in the Brewfile 

```
mas 'WhatsApp Desktop', id: 1147396723
```





# ToDo

- See [todo.md](todo.md)
