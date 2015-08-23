# Description

My Vim Setup

## Installation

Make a backup of your current vimrc if you have one. If not, ignore this section.

```    
mv ~/.vim ~/vim_backup
mv ~/.vimrc ~/vim_backup/vimrc
```

After making backup, clone this repo into your .vim folder.

```
git clone git@github.com:HiCodin/dotvim.git ~/.vim
```

Symlink the `vimrc` so that `Vim` takes effect.

```
ln -s ~/.vim/dotvim/vimrc ~/.vimrc
```

### Plugins 

[Vim Plug](https://github.com/junegunn/vim-plug) is used for managing plugins.
Install it, launch `Vim` and run `:PlugInstall`. 
It will install all the plugins specified in the `vimrc` file.

### Screenshots

![vimrc](https://cloud.githubusercontent.com/assets/13816418/9427648/8fb59fe6-49ae-11e5-8ac0-181664c65d3d.png)
![example](https://cloud.githubusercontent.com/assets/13816418/9427647/8f72f902-49ae-11e5-8cc7-f9baca9c6275.png)
