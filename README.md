# Description

My Vim Setup

## Installation

Make a backup of your current vim setup. 

```    
mv ~/.vim ~/vim_backup
mv ~/.vimrc ~/vim_backup/vimrc
```

After making backup, clone this repo to your home directory.

```
git clone git@github.com:HiCodin/dotfiles.git
```

#### Bash

You will need [git-prompt.sh](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh) to see git status.
Download and put them in your home directory. Lastly, create symlink so that `dotfiles/bash_profile` points to `~/.bash_profile`.

```
ln -s dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile
```

##### How Bash looks
![simple-bash-prompt](https://raw.githubusercontent.com/HiCodin/dotfiles/master/simple-bash-prompt.png)
#### Vim
Symlink `dotfiles/vimrc` to `~/.vimrc` so that `Vim` takes effect.

```
ln -s dotfiles/vimrc ~/.vimrc
```

Use [Vim Plug](https://github.com/junegunn/vim-plug) for plugin management.
Install it, launch `Vim` and run `:PlugInstall`.

##### How Vim looks

![vimrc](https://cloud.githubusercontent.com/assets/13816418/9438729/91657b62-4a86-11e5-9271-38d63ce08ff7.png)
![example](https://cloud.githubusercontent.com/assets/13816418/9438978/bc1e89c8-4a88-11e5-8b3f-ffc644b26a4d.png)
