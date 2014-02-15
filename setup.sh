#!/bin/bash
############################

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
# install vim if not detected {{{
# TODO: check features, if they are not preset - force compile
# TODO: if root - do not local install

vimversion="7.4"
vimdest="$DIR/vim.tar.bz2"

curVimVersion=`vim --version 2>/dev/null | egrep "VIM - Vi" | sed -E "s/.*([0-9]+)\.([0-9]+).*/\\1\\2/"`
neededVimVersion=`echo "$vimversion" | sed -E "s/.*([0-9]+)\.([0-9]+).*/\\1\\2/"`

if [ -d "$DIR/bin/vim" ] || [ -n $curVimVersion ] || ! [[ $curVimVersion -lt $neededVimVersion ]]; then
    echo "vim already installed."
else
    echo "installing vim $vimversion..."

    echo "installing ncurses..."

    ncursesVersion="5.9"
    ncursesDest="$DIR/ncurses.tar.gz"
    ncursesSourceDir="$DIR/ncurses-$ncursesVersion"

    wget -O $ncursesDest http://ftp.gnu.org/pub/gnu/ncurses/ncurses-$ncursesVersion.tar.gz

    tar -xf $ncursesDest

    cd $ncursesSourceDir

    ./configure --prefix=$DIR
    make && make install

    export CPPFLAGS="-I$DIR/include"
    export LDFLAGS="-L$DIR/lib"

    vimsourcedir="$DIR/vim$neededVimVersion"

    if [ ! -d $vimsourcedir ]; then
        cd $DIR

        wget -O $vimdest ftp://ftp.vim.org/pub/vim/unix/vim-$vimversion.tar.bz2

        echo "Extracting..."
        tar -jxf $vimdest
        echo "Done."

        # mac only
        if [[ "$OSTYPE" == "darwin"* ]]; then
            patch $vimsourcedir/src/os_unix.c patch.diff
        fi
    fi

    cd $vimsourcedir

    ./configure --with-features=huge \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --enable-luainterp \
                --enable-cscope \
                --disable-gpm \
                --with-tlib=ncurses \
                --prefix=$DIR \
                --with-x=yes \
                --enable-acl \
                --disable-gui \
                --enable-multibyte
    make
    make install

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
    make && make install
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

    curl http://beyondgrep.com/ack-2.12-single-file > $DIR/bin/ack && chmod 0755 $DIR/bin/ack
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
