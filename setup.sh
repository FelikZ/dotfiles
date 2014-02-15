#!/bin/bash
############################

TARGET_FILE=$(dirname ${BASH_SOURCE[0]})

cd `dirname $TARGET_FILE`
TARGET_FILE=`basename $TARGET_FILE`

while [ -L "$TARGET_FILE" ]
do
    TARGET_FILE=`readlink $TARGET_FILE`
    cd `dirname $TARGET_FILE`
    TARGET_FILE=`basename $TARGET_FILE`
done

PHYS_DIR=`pwd -P`
DIR=$PHYS_DIR/$TARGET_FILE

cd $DIR

# install vim if not detected {{{
# TODO: check features, if they are not preset - force compile
# TODO: if root - do not local install

vimversion="7.4"
vimdest="$cwd/vim.tar.bz2"

curVimVersion=`vim --version 2>/dev/null | egrep "VIM - Vi" | sed -E "s/.*([0-9]+)\.([0-9]+).*/\\1\\2/"`
neededVimVersion=`echo "$vimversion" | sed -E "s/.*([0-9]+)\.([0-9]+).*/\\1\\2/"`

if [ ! $curVimVersion -lt $neededVimVersion ]; then
    echo "vim already installed."
else
    echo "installing vim $vimversion..."

    vimsourcedir="$cwd/vim$neededVimVersion"

    if [ ! -d $vimsourcedir ]; then
        wget -O $vimdest ftp://ftp.vim.org/pub/vim/unix/vim-$vimversion.tar.bz2

        echo "Extracting..."
        tar -zxf $vimdest
        echo "Done."
    fi

    cd $vimsourcedir

    ./configure --with-features=huge \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --enable-luainterp \
                --enable-cscope \
                --disable-gpm \
                --enable-multibyte \
                --prefix=$DIR

    make
    make install DESTDIR=$DIR

    rm -Rf $vimsourcedir
    rm -Rf $vimdest
fi
# }}}

cd $DIR

# ctags {{{
if [ -f "$DIR/bin/ctags" ]; then
    echo "ctags already installed."
else
    echo "ctags will be installed."

    wget -O ctags.tar.gz http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar zxf ctags.tar.gz
    cd ctags-5.8
    ./configure --prefix=$DIR
    make && make install DESTDIR=$DIR
    cd $DIR
    rm -Rf ctags-5.8
    rm -Rf ctags.tar.gz
fi
# }}}

isAck=`ack --version 2>/dev/null`
# ack {{{
if [ -n "$isAck" ] || [ -f "$DIR/bin/ack" ]; then
    echo "ack already installed."
else
    echo "ack will be installed."

    curl http://beyondgrep.com/ack-2.12-single-file > ~/felikz/bin/ack && chmod 0755 ~/felikz/bin/ack
fi
# }}}

# TODO: auto init and update neobundle if its not

echo "Setting up environment..."

# dirs
mkdir -p "$DIR/tmp/vimswap"

# aliases
alias vim="vim -u $DIR/.vimrc"

# exports
export PATH="$DIR/bin:$DIR/usr/local/bin:$PATH"

echo "Done."
