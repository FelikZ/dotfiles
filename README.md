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


1. <http://github.comileszs/ack.vim>
1. <http://github.cochrisbra/csv.vim>
1. <http://github.cokien/ctrlp.vim>
1. <http://github.coRaimondi/delimitMate>
1. <http://github.comattn/emmet-vim>
1. <http://github.coothree/html5.vim>
1. <http://github.covim-scripts/JavaScript-Indent>
1. <http://github.coothree/javascript-libraries-syntax.vim>
1. <http://github.covim-scripts/LargeFile>
1. <http://github.cogregsexton/MatchTag>
1. <http://github.cojuvenn/mustache.vim>
1. <http://github.coscrooloose/nerdcommenter>
1. <http://github.coscrooloose/nerdtree>
1. <http://github.coscrooloose/syntastic>
1. <http://github.cotomtom/tlib_vim>
1. <http://github.com/tpope/vim-sensible>
1. <http://github.cotpope/vim-abolish>
1. <http://github.coMarcWeber/vim-addon-mw-utils>
1. <http://github.coPeterRincker/vim-argumentative>
1. <http://github.cobling/vim-bufferline>
1. <http://github.cotpope/vim-bundler>
1. <http://github.cokchmck/vim-coffee-script>
1. <http://github.cogorodinskiy/vim-coloresque>
1. <http://github.coaltercation/vim-colors-solarized>
1. <http://github.cohail2u/vim-css3-syntax>
1. <http://github.cojunegunn/vim-easy-align>
1. <http://github.coLokaltog/vim-easymotion>
1. <http://github.cotpope/vim-endwise>
1. <http://github.cotpope/vim-haml>
1. <http://github.convie/vim-ini>
1. <http://github.cojelera/vim-javascript-syntax, {autoload:{filetypes:[javascript]}}>
1. <http://github.coelzr/vim-json>
1. <http://github.cogroenewege/vim-less>
1. <http://github.cotpope/vim-markdown>
1. <http://github.coterryma/vim-multiple-cursors>
1. <http://github.comoll/vim-node>
1. <http://github.cotpope/vim-rails>
1. <http://github.cotpope/vim-repeat>
1. <http://github.covim-ruby/vim-ruby>
1. <http://github.cogoldfeld/vim-seek>
1. <http://github.cogarbas/vim-snipmate>
1. <http://github.cohonza/vim-snippets>
1. <http://github.cotpope/vim-speeddating>
1. <http://github.cowavded/vim-stylus>
1. <http://github.cotpope/vim-surround>
1. <http://github.cotpope/vim-unimpaired>
1. <http://github.covim-scripts/visualrepeat>
