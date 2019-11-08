# Aboutlo's Dotfiles

After many years with a micro .bash_profile I finally move to get something more reliable.
This is my working progress dotfiles repo. It's still tiny but definitely better.

## Disclaimer
I'm a `Javascript` and ~Ruby on Rails~ engineer. I work on a MacOS box.
So what you find here is a toolbox for those environments.

## Install

    $ git clone git@github.com:aboutlo/dotfiles.git
    $ cd dotfiles
    $ chmod +x install.sh
    $ ./install.sh

## Post install

As web developer you have to deal with IE. Yes I know it's a sad news but you are payed to do that.
Run this infernal command to get any IE versions you need directly on your box. ( ~45GB required for a full install )

    $ ievm curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="8 9 11" bash

Take a cuppa. It will take a while...

## How to

- Open a new terminal and you will get you new colored `PS1` prefix
- Git shortcuts are based on `g` it means git follow by the first letter of the command  `c`. it means `git commit --verbose`
- All GIT shortcuts are listed by `gla`
- To see all configured aliases `cat ~/.aliases`
- Finally take a look of gitconfig and gitignore_global. Change what you need ;)

## Appify
 
- `utils/appify.sh utils/xchrome.sh`
- move `utils/xchrome.app` to `/applications`
- Right click on the file. Click on the icon. Copy and paste an image :)

## rsync

sudo rsync -ravth /from/a/path/* /to/a/path


