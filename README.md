DOTFILES
========

My linux dotfile experiments


##TO INSTALL:
1. Create backup folder.
    $ mkdir -p ~/old_dotfiles
2. Move all your files containing .vimrc .vim .vim.blabla etc to that backup folder.
    $ mv .vim* old_dotfiles/
3. Clone the repo
    $ git clone https://github.com/kapral18/dotfiles.git ~/dotfiles
4. Clone the neobundle pm submodule for plugins.
    $ cd dotfiles && git submodule init && git submodule update
5. Help yourself and Frodo to destroy the ring.
    $ chmod +x init.sh
    $ /init.sh
6. Enjoy.

##And you're done.
