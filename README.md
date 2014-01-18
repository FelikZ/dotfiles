DOTFILES
========

My linux dotfile experiments


##TO INSTALL:
1. Create backup folder.

    ```
    $ mkdir -p ~/old_dotfiles
    ```        
2. Move all your files containing .vimrc .vim .vim.blabla etc to that backup folder.
    
    ```
    $ mv .vim* old_dotfiles/
    ```
3. Clone the repo
    
    ```
    $ git clone https://github.com/kapral18/dotfiles.git ~/dotfiles
    ```
4. Clone the neobundle pm submodule for plugins.
    
    ```
    $ cd dotfiles && git submodule init && git submodule update
    ```
5. Help yourself and Frodo to destroy the ring.
    
    ```
    $ chmod +x init.sh
    $ ./init.sh
    ```
6. Enjoy.

##And you're done.

- - -

## USED PLUGINS

All of my plugins are collected in vimrc.neobundle file so its not that
tricky to guess that <https://github.com/Shougo/neobundle.vim> is handling the plugin
management so when you pass through all the above stages and have your symlinks at
place and finally log into vim you'll be respectively suggested to install all the plugins
that are listed in vimrc.neobundle file. So here they are:


- <http://github.com/tpope/vim-sensible>
- <http://github.com/tpope/vim-repeat>
- <http://github.com/vim-scripts/visualrepeat>
- <http://github.com/vim-scripts/LargeFile>
- <http://github.com/tpope/vim-bundler>
- <http://github.com/tpope/vim-rails>
- <http://github.com/moll/vim-node>
- <http://github.com/Lokaltog/vim-easymotion>
- <http://github.com/goldfeld/vim-seek>
- <http://github.com/tpope/vim-surround>
- <http://github.com/tpope/vim-speeddating>
- <http://github.com/Raimondi/delimitMate>
- <http://github.com/tpope/vim-endwise>
- <http://github.com/scrooloose/nerdcommenter>
- <http://github.com/junegunn/vim-easy-align>
- <http://github.com/sickill/vim-pasta>
- <http://github.com/terryma/vim-multiple-cursors>
- <http://github.com/tpope/vim-abolish>
- <http://github.com/scrooloose/nerdtree>
- <http://github.com/gorodinskiy/vim-coloresque>
- <http://github.com/tpope/vim-unimpaired>
- <http://github.com/MarcWeber/vim-addon-mw-utils>
- <http://github.com/tomtom/tlib_vim>
- <http://github.com/garbas/vim-snipmate>
- <http://github.com/honza/vim-snippets>
- <http://github.com/mattn/emmet-vim>
- <http://github.com/scrooloose/syntastic>
- <http://github.com/vim-ruby/vim-ruby>
- <http://github.com/pangloss/vim-javascript>
- <http://github.com/kchmck/vim-coffee-script>
- <http://github.com/othree/html5.vim>
- <http://github.com/tpope/vim-haml>
- <http://github.com/hail2u/vim-css3-syntax>
- <http://github.com/groenewege/vim-less>
- <http://github.com/tpope/vim-markdown>
- <http://github.com/chrisbra/csv.vim>
- <http://github.com/nvie/vim-ini>
- <http://github.com/elzr/vim-json>
- <http://github.com/bling/vim-bufferline>
- <http://github.com/altercation/vim-colors-solarized>
