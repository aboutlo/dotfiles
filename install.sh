#!/bin/bash
echo 'Installing Homebrew...'
if ! command -v brew &>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Installing ruby via rbenv ...'
brew install rbenv
brew install rbenv-default-gems
brew install rbenv-gem-rehash
brew install rbenv-readline
brew install ruby-build --with-libyaml --with-openssl
rbenv install 2.1.2

echo 'Installing bundler ...'
gem install bundler # install gems from Gemfile

echo 'Installing brewdler ...'
gem install brewdler
brewdle install # install all packages defined into Brewfile

echo 'link dotfiles'
FILES=$PWD/dotfiles/*
for file in $FILES
do
  if [ ! -f "$(eval echo ~$USER)/.$(basename $file)" ]; then
    echo "link $file"
    ln -s $file $(eval echo ~$USER)/.$(basename $file)
  fi
done

