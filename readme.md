# Settings up the new machine

> See **Snapshot - before install or nuking** BEFORE INSTALLING !

- Run the installation script...

```sh
git clone https://github.com/theodson/dotfiles.git 
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
```
- make a copy of existing important configurations in HOME directory
```
tar -czLf $HOME/predotfiles.my-configuration.tar.gz $HOME/{.vim,.bash_profile,.bashrc,.profile,.config,.zshrc,.ssh,ssh_config,.netrc,.gnupg,.Brewfile.lock.json} $HOME/predotfiles.Brewfile $HOME/.composer/{composer.json,composer.lock} 2>/dev/null
```
> Important: move these archived files __off machine__ somewhere sage ☁️  e.g. 
>
> ```scp $HOME/predotfiles.my-configuration.tar.gz user@sagehost:safeplace```

- unpushed changes / branches / repos 
- Ensure TimeMachine/BackBlaze/etc is recently synced.

- ~~run `mackup backup`~~

# Updating

Re-run the installation script

```
bash dotfiles/install
```

# Troubleshooting

Lets face it, its likely, brew changes and constant WIP...!

If our custom **`switch_php`** fails to work, try this sequence of tasks.

```
php_uninstall
switch_php 8.1
switch_php 7.0
```


# ToDo
- Fix SHIFT+CMD+A conflict on PHPStorm and macOs
- ~jump to next/previous word ALT+R ALT+L in kitty~
- ~CMD+F for find in kitty - how ?~
- Review `mackup` - https://github.com/lra/mackup
- Review `restic` - https://restic.readthedocs.io/en/stable/040_backup.html
