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

#### Git

You will need [git-prompt.sh](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh) to see git status in bash.
Download and put it in your home directory. Symlink `~/dotfiles/bash_profile` to `~/.bash_profile`.

```
ln -s ~/dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile
```
![simple-bash-prompt](https://cloud.githubusercontent.com/assets/13816418/10546520/6a7c41be-7454-11e5-943b-b3bee38940bc.png)

#### Vim
Require `Vim` to be complied with `Lua` for [Neocomplete](https://github.com/Shougo/neocomplete.vim). <br>
Require linting tools for `Syntastic` and [Exuberant Ctags](http://ctags.sourceforge.net/) for `Tagbar` to work. <br>
Symlink `~/dotfiles/vimrc` to `~/.vimrc`.
```
ln -s ~/dotfiles/vimrc ~/.vimrc
```
Plugins are managed by [Vim-Plug](https://github.com/junegunn/vim-plug).
Save `~/.vimrc` in `Vim` and run `:PlugInstall`. <br>

![vimrc](https://cloud.githubusercontent.com/assets/13816418/10545823/a6b80518-7450-11e5-9659-8c44d085ff4c.png)
