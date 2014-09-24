sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common
sudo apt-get install lua5.1 liblua5.1-dev libncurses5-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev libatk1.0-dev make
wget -O "vim-7.4.tar.bz2" "ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2"
tar -jxf "vim-7.4.tar.bz2"
cd "vim74"
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

rm ../"vim-7.4.tar.bz2"
