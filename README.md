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

Symlink everything inside `dotfiles` directory to respective config files.

```
ln -s ~/dotfiles/bash_profile ~/.bash_profile
source ~/.bash_profile
```
```
ln -s ~/dotfiles/vimrc ~/.vimrc
```

### Requirements

[Git-Prompt](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh).
Download and put it in your home directory. Symlink `~/dotfiles/bash_profile` to `~/.bash_profile`.<br>

Compile `Vim` wth `Lua` support for [Neocomplete](https://github.com/Shougo/neocomplete.vim). <br>
Linting tools for `Syntastic`.
[Exuberant Ctags](http://ctags.sourceforge.net/) for `Tagbar` to work. <br><br>
Plugins are managed by [Vim-Plug](https://github.com/junegunn/vim-plug).
Save `~/.vimrc` in `Vim` and run `:PlugInstall`. <br>

![vimrc](https://cloud.githubusercontent.com/assets/13816418/10941111/4dc872f2-8338-11e5-8017-5432b4619481.png)
