# TODO
- Automate creation `~/.gitconfig.local` with placeholder variables if it doesn't exist
- Add Karabiner config
- Add basic Mac preferences, such as open home rather than recent in finder
- Automate create of new SSH keys (https://github.com/driesvints/dotfiles/pull/57)

# Old machine
- Check before burning the hard drive for unsynced content
- Check git for unpushed changes / branches / repos
- Backup gpg keys

# New machine

```sh
mkdir $HOME/Code && cd $HOME/Code
git clone https://github.com/timacdonald/dotfiles.git && cd dotfiles
zsh install
compaudit | xargs chmod g-w
```

- Apple:
  - Sign into iCloud
  - Swap iTunes account to other Apple ID
- Setup Xcode:
  - [Install](https://apps.apple.com/au/app/xcode/id497799835?mt=12)
  - Open 
  - Run `xcode-select --install`
- Install browser plugins:
  - [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
  - [1Password](https://1password.com/browsers/firefox/)
- [Generate SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add to GitHub
- [Generate GPG key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key) and add to GitHub
- Add "email" to local git config
- Install printer
- Install Monolisa
- AWS cli config steps
- gpg config steps
