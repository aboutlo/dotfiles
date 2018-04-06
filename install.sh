#!/bin/bash
echo 'Installing Homebrew...'
if ! command -v brew &>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo 'install git'
brew install git

echo 'install nvm'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

echo 'install yarn'
brew install yarn --without-node

echo 'Installing brewdler ...'
brew tap Homebrew/brewdler
brew bundle  # install all packages defined into Brewfile

echo 'link dotfiles'
FILES=$PWD/dotfiles/*
for file in $FILES
do
  if [ ! -f "$(eval echo ~$USER)/.$(basename $file)" ]; then
    echo "link $file"
    ln -s $file $(eval echo ~$USER)/.$(basename $file)
  fi
done

