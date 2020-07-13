#!/bin/sh

echo "Installing Homebrew"
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo "Homebrew installed"
else
    echo "Homebrew is already installed"
fi

echo "Updating Homebrew"
brew update
echo "Homebrew updated"

echo "Installing Homebrew dependencies"
brew tap Homebrew/bundle
brew bundle
echo "Homebrew dependencies installed"
