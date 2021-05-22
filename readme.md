# Before nuking the previous machine

- Check before burning the hard drive for unsynced content, including:
    - Home directory files
    - unpushed changes / branches / repos

# Settings up the new machine

1. Apple:
   - Sign into iCloud
   - Swap Music and App Store account to other Apple ID
2. Setup Xcode:
   - [Install](https://apps.apple.com/au/app/xcode/id497799835?mt=12)
   - Open Xcode
   - Run `xcode-select --install`
3. Install and setup 1Password
3. Run the installation script...
```sh
mkdir $HOME/Code && cd $HOME/Code
git clone https://github.com/timacdonald/dotfiles.git && cd dotfiles
bash install
compaudit | xargs chmod g-w
```
4. Open Karabiner elements
4. Import GPG key
```sh
gpg —-import /path/to/secret-key-backup.asc
gpg --list-keys
# copy keyid
gpg --edit-key {keyid} trust quit
# trust ultimately
```
5. Trust key
5. Import SSH key
6. Install browser plugins:
   - [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
   - [1Password](https://1password.com/browsers/firefox/)
7. Install home printer
8. Install Monolisa font

# Updating

Re-run the installation script
