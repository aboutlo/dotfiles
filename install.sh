#!/bin/bash
echo 'Installing Homebrew...'
if ! command -v brew &>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo 'install git'
brew install git

echo 'install nvm'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo 'install yarn'
brew install yarn

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

echo 'Installing zsh...'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -s $DOTFILES/zsh/custom/plugins/node ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/node

source ~/.zshrc

