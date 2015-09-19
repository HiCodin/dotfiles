# Description

My Vim Setup

## Installation

Make a backup of your current vim setup.

```    
mv ~/.vim ~/vim_backup
mv ~/.vimrc ~/vim_backup/vimrc
```

Clone this repo to your home directory.

```
git clone git@github.com:HiCodin/dotfiles.git
```

#### Git Status

You will need [git-prompt.sh](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh) to see git status in bash.
Download and put it in your home directory. Symlink `~/dotfiles/bash_profile` to `~/.bash_profile`.

```
ln -s ~/dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile
```
![simple-bash-prompt](https://raw.githubusercontent.com/HiCodin/dotfiles/master/simple-bash-prompt.png)

#### Vim
Symlink `~/dotfiles/vimrc` to `~/.vimrc`.
```
ln -s ~/dotfiles/vimrc ~/.vimrc
```
Plugins are managed by [Plug](https://github.com/junegunn/vim-plug).
Save `~/.vimrc` in `Vim` and run `:PlugInstall`.

![vimrc](https://cloud.githubusercontent.com/assets/13816418/9866773/b94a4830-5b8c-11e5-80be-0fbf153656be.png)
![example](https://cloud.githubusercontent.com/assets/13816418/9438978/bc1e89c8-4a88-11e5-8b3f-ffc644b26a4d.png)
