This is still a WIP. probably always will be.

# TODO.
- Forklift sites (private)
- postman collections (private)
- ~/.vim (Plugged etc)
- ~/.ssh/config (private)
- iTerm config
- backup ssh / gpg keys
- Sequel Pro config (private)
- Rectangle (window management on iMac)
- VirtualBox (windows virtualiser)
- create `~/.gitconfig.local` with placeholder variables if it doesn't exist
- add .fzf.zsh
- make fzf install only do zsh stuff

# Process
- Check before burning the hard drive for unsynced content
- Check git for unpushed branches
- ssh public key creation
- AWS cli config steps
- gpg config steps

# New machine
- Sign into iCloud
- Swap iTunes account to other Apple ID
- [Install xCode](https://apps.apple.com/au/app/xcode/id497799835?mt=12)
- Open Xcode
- `xcode-select --install`
- install https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/
- install https://1password.com/browsers/firefox/
- [Generate SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and add to GitHub
- [Generate GPG key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key) and add to GitHub

```
mkdir Code && cd Code
git clone https://github.com/timacdonald/dotfiles.git && cd dotfiles
bash install
compaudit | xargs chmod g-w
```

- Install printer
- Install Monolisa
