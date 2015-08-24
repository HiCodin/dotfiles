# Description

My Vim Setup

## Installation

Make a backup of your current vim setup first. 

```    
mv ~/.vim ~/vim_backup
mv ~/.vimrc ~/vim_backup/vimrc
```

After making backup, clone this repo to your home directory.

```
git clone git@github.com:HiCodin/dotvim.git 
```

#### Setting up Vim
Symlink the `vimrc` so that `Vim` takes effect.

```
ln -s dotfiles/vimrc ~/.vimrc
```

#### Setting up Bash

You will need [git-completion.bash](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash) and [git-prompt.sh](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh) to see minimal git status in bash prompt.
Download them and put them in your home directory. 
Symlink `bash_profile` to `~/.bash_profile` so that Bash takes effect.

```
ln -s dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile
```

### Plugins 

[Vim Plug](https://github.com/junegunn/vim-plug) is used for managing plugins.
Install it, launch `Vim` and run `:PlugInstall`. 
It will install all the plugins specified in the plugins section in `vimrc` .

### Screenshots

![simple-bash-prompt](https://raw.githubusercontent.com/HiCodin/dotfiles/master/simple-bash-prompt.png)
![vimrc](https://cloud.githubusercontent.com/assets/13816418/9427648/8fb59fe6-49ae-11e5-8ac0-181664c65d3d.png)
![example](https://cloud.githubusercontent.com/assets/13816418/9427647/8f72f902-49ae-11e5-8cc7-f9baca9c6275.png)

