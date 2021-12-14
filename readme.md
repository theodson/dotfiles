# Before nuking the previous machine

- Check before burning the hard drive for unsynced content, including:
    - Home directory files
    - unpushed changes / branches / repos

- run `mackup backup`



# Settings up the new machine

- Run the installation script...
```sh
git clone https://github.com/theodson/dotfiles.git && cd dotfiles
bash install
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
- Install browser plugins:
   - [Vue.js devtools](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)
   - [1Password](https://1password.com/browsers/firefox/)
   - [Containers plugin](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)
- Install Monolisa font

# Updating

Re-run the installation script


# TODO 
- Fix SHIFT+CMD+A conflict on PHPStorm and macOs
- ~jump to next/previous word ALT+R ALT+L in kitty~
- Review `mackup` - https://github.com/lra/mackup
- Review `restic` - https://restic.readthedocs.io/en/stable/040_backup.html
