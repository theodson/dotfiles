# Settings up the new machine

> See **Snapshot - before install or nuking** BEFORE INSTALLING !

## Fork!

Fork the repository and make it your own! 



## 🤖 Clone 

- Clone your repository

```bash
# change reponame to your forked repo

cd $HOME && git clone https://github.com/theodson/dotfiles.git 
```



##  🧨 Backup 

**Before** installing on **<u>an existing machine</u>** take a snapshot backup of your current setup. 

> This isn't applicable on a clean/bare newly installed machine.



- Update brew ( optional )

```
brew update
```


- **Archive list of existing apps** installed via brew, brew bundle or App Store
  `preinstall` archives some existing dotfiles... 

```
pushd $HOME/dotfiles && 
bash preinstall 
popd
```
Important: move these archived files __off your machine__ to somewhere safe ☁️  e.g. 



- Ensure TimeMachine/BackBlaze/etc is recently synced.

- ~~run `mackup backup`~~
- ~~run `restic`~~



##  🧐 Review

and change to your liking... You'll probably want to **change these files** once forked.

- `dotfiles/files/.gitconfig`
- `dotfiles/files/.Brewfile`
- `dotfiles/switch_php` function `composer_global_install()` to specify php version specific installs (*a default set exists*)



# Install

- Clone your repository

```sh

# change reponame to your forked repo
git clone https://github.com/theodson/dotfiles.git 

```

- link files and use the new bash environment

```

bash dotfiles/link

source $HOME/.bashrc # or open a new terminal

```

- Install

```

source dotfiles/install


```

> If installing on an existing machine (not pristine/clean install of macOs) you will experience some issues until the `.Brewfile` is customised to your liking. 
>
> Until the brew bundle completes succesfully the remainder of the script 

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



# Updating

Re-run the install script

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

bash dotfiles/install

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

Notes:

1. Already installed Apps (not through the `mas` command) should be removed first and then added to the Brewfile.
2. Some Apps will not install unless already purchased, you may need to manually via the AppStore application purchase/install the app first.



## Update my Brewfile with my Apps - how to ?

In summary, you should compare your generated `$HOME/predotfiles.Brewfile` file with the `dotfiles/files/.Brewfile` and to determine any new `mas` entries review the `$HOME/predotfiles.MacAppStore_list` list of applications. 

See Troubleshooting for some help of using the `mas` command and searching for Apps.



# ToDo

- See [todo.md](todo.md)
