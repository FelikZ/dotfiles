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

1. <http://github.com/chrisbra/csv.vim>
1. <http://github.com/kien/ctrlp.vim>
1. <http://github.com/Raimondi/delimitMate>
1. <http://github.com/mattn/emmet-vim>
1. <http://github.com/othree/html5.vim>
1. <http://github.com/vim-scripts/LargeFile>
1. <http://github.com/gregsexton/MatchTag>
1. <http://github.com/juvenn/mustache.vim>
1. <http://github.com/Shougo/neocomplcache>
1. <http://github.com/Shougo/neosnippet>
1. <http://github.com/Shougo/neosnippet-snippets>
1. <http://github.com/scrooloose/nerdcommenter>
1. <http://github.com/scrooloose/nerdtree>
1. <http://github.com/scrooloose/syntastic>
1. <http://github.com/tomtom/tlib_vim>
1. <http://github.com/tpope/vim-abolish>
1. <http://github.com/MarcWeber/vim-addon-mw-utils>
1. <http://github.com/bling/vim-bufferline>
1. <http://github.com/tpope/vim-bundler>
1. <http://github.com/kchmck/vim-coffee-script>
1. <http://github.com/gorodinskiy/vim-coloresque>
1. <http://github.com/altercation/vim-colors-solarized>
1. <http://github.com/hail2u/vim-css3-syntax>
1. <http://github.com/junegunn/vim-easy-align>
1. <http://github.com/Lokaltog/vim-easymotion>
1. <http://github.com/tpope/vim-endwise>
1. <http://github.com/tpope/vim-haml>
1. <http://github.com/nvie/vim-ini>
1. <http://github.com/pangloss/vim-javascript>
1. <http://github.com/jelera/vim-javascript-syntax>
1. <http://github.com/elzr/vim-json>
1. <http://github.com/groenewege/vim-less>
1. <http://github.com/tpope/vim-markdown>
1. <http://github.com/terryma/vim-multiple-cursors>
1. <http://github.com/moll/vim-node>
1. <http://github.com/sickill/vim-pasta>
1. <http://github.com/tpope/vim-rails>
1. <http://github.com/tpope/vim-repeat>
1. <http://github.com/vim-ruby/vim-ruby>
1. <http://github.com/goldfeld/vim-seek>
1. <http://github.com/tpope/vim-sensible>
1. <http://github.com/garbas/vim-snipmate>
1. <http://github.com/honza/vim-snippets>
1. <http://github.com/tpope/vim-speeddating>
1. <http://github.com/wavded/vim-stylus>
1. <http://github.com/tpope/vim-surround>
1. <http://github.com/tpope/vim-unimpaired>
1. <http://github.com/lukaszb/vim-web-indent>
1. <http://github.com/vim-scripts/visualrepeat>
