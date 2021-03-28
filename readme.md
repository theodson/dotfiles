# TODO

- Automate creation `~/.gitconfig.local` with placeholder variables if it doesn't exist.
- Add Karabiner config.
- Add basic Mac preferences, such as open home rather than recent in finder
- Automate the process of downloading installing the Monolisa font via a cloud based script that is password protected
- Automate installation of browser plugins(?)

# Before nuking the previous machine

- Check before burning the hard drive for unsynced content
- Check git for unpushed changes / branches / repos
- Backup gpg keys

# Settings up the new machine

1. Apple:
   - Sign into iCloud
   - Swap iTunes account to other Apple ID
2. Setup Xcode:
   - [Install](https://apps.apple.com/au/app/xcode/id497799835?mt=12)
   - Open 
   - Run `xcode-select --install`
3. Run the installation script...
```sh
mkdir $HOME/Code && cd $HOME/Code
git clone https://github.com/timacdonald/dotfiles.git && cd dotfiles
zsh install
compaudit | xargs chmod g-w
```
4. Add GPG key from old machine
5. Install browser plugins:
   - [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
   - [1Password](https://1password.com/browsers/firefox/)
6. Install home printer
7. Install Monolisa font

# After setting up the new machine

Ongoing run `$ dots` and the install / update script will run, which is idempotent (well, kinda. It might get a newer version - but it should have the same result essentially).
