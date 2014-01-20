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
    $ ./setup_proper_symlinks.sh
    ```
6. Enjoy.

##And you're done.

- - -

## USED PLUGINS

All of my plugins are collected in vimrc.neobundle file so its not that
tricky to guess that <https://github.com/Shougo/neobundle.vim> is handling the plugin
management so when you pass through all the above stages and have your symlinks at
place and finally log into vim you'll be respectively suggested to install all the plugins
that are listed in vimrc.neobundle file. So here they are (sorted by plugnames):

1. NeoBundle "chrisbra/csv.vim"
1. NeoBundle "kien/ctrlp.vim"
1. NeoBundle "Raimondi/delimitMate"
1. NeoBundle "mattn/emmet-vim"
1. NeoBundle "othree/html5.vim"
1. NeoBundle "vim-scripts/LargeFile"
1. NeoBundle "gregsexton/MatchTag"
1. NeoBundle "juvenn/mustache.vim"
1. NeoBundle "Shougo/neocomplete"
1. NeoBundle "Shougo/neosnippet"
1. NeoBundle "Shougo/neosnippet-snippets"
1. NeoBundle "scrooloose/nerdcommenter"
1. NeoBundle "scrooloose/nerdtree"
1. NeoBundle "scrooloose/syntastic"
1. NeoBundle "tomtom/tlib_vim"
1. NeoBundle "tpope/vim-abolish"
1. NeoBundle "MarcWeber/vim-addon-mw-utils"
1. NeoBundle "bling/vim-bufferline"
1. NeoBundle "tpope/vim-bundler"
1. NeoBundle "kchmck/vim-coffee-script"
1. NeoBundle "gorodinskiy/vim-coloresque"
1. NeoBundle "altercation/vim-colors-solarized"
1. NeoBundle "hail2u/vim-css3-syntax"
1. NeoBundle "junegunn/vim-easy-align"
1. NeoBundle "Lokaltog/vim-easymotion"
1. NeoBundle "tpope/vim-endwise"
1. NeoBundle "tpope/vim-haml"
1. NeoBundle "nvie/vim-ini"
1. NeoBundle "pangloss/vim-javascript"
1. NeoBundle "jelera/vim-javascript-syntax"
1. NeoBundle "elzr/vim-json"
1. NeoBundle "groenewege/vim-less"
1. NeoBundle "tpope/vim-markdown"
1. NeoBundle "terryma/vim-multiple-cursors"
1. NeoBundle "moll/vim-node"
1. NeoBundle "sickill/vim-pasta"
1. NeoBundle "tpope/vim-rails"
1. NeoBundle "tpope/vim-repeat"
1. NeoBundle "vim-ruby/vim-ruby"
1. NeoBundle "goldfeld/vim-seek"
1. NeoBundle "tpope/vim-sensible"
1. NeoBundle "garbas/vim-snipmate"
1. NeoBundle "honza/vim-snippets"
1. NeoBundle "tpope/vim-speeddating"
1. NeoBundle "wavded/vim-stylus"
1. NeoBundle "tpope/vim-surround"
1. NeoBundle "tpope/vim-unimpaired"
1. NeoBundle "lukaszb/vim-web-indent"
1. NeoBundle "vim-scripts/visualrepeat"
