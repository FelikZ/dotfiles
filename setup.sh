#!/bin/bash
############################

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# exports
export PATH="$DIR/bin:$DIR/usr/local/bin:$PATH"

export CPPFLAGS="-I$DIR/include"
export CPATH="$DIR/include/"

export LDFLAGS="-L$DIR/lib"
export LD_LIBRARY_PATH="-L$DIR/lib"
export LIBRARY_PATH="$DIR/lib/"


# install vim if not detected
# TODO: make custom ./configure and make file for installing vim and features
# TODO: params to install global / localy / standalone
# TODO: quite model

vimversion="7.4"
vimdest="$DIR/vim.tar.bz2"

curVimVersion=`vim --version 2>/dev/null | egrep "VIM - Vi" | sed -E "s/.*([0-9]+)\.([0-9]+).*/\\1\\2/"`
neededVimVersion=`echo "$vimversion" | sed -E "s/.*([0-9]+)\.([0-9]+).*/\\1\\2/"`

if [ -f "$DIR/bin/vim" ] || ( [ -n "$curVimVersion" ] && [[ $curVimVersion -ge $neededVimVersion ]] ); then
    echo "vim already installed."
else
    echo "installing vim $vimversion..."

    if [ -f "$DIR/lib/libncurses.a" ]; then
        echo "Ncurses already installed"
    else
        echo "Installing ncurses..."

        ncursesVersion="5.9"
        ncursesDest="$DIR/ncurses.tar.gz"
        ncursesSourceDir="$DIR/ncurses-$ncursesVersion"

        wget -O "$ncursesDest" "http://ftp.gnu.org/pub/gnu/ncurses/ncurses-$ncursesVersion.tar.gz"

        tar -xf "$ncursesDest"

        cd "$ncursesSourceDir"

        ./configure --prefix="$DIR"
        make && make install

        rm -rf "$ncursesSourceDir"
        rm -rf "$ncursesDest"
    fi

    # Installing LUA
    curLuaVersion=`lua -v 2>/dev/null | egrep "Copyright " | sed -E "s/.*([0-9]+)\.([0-9]+)\.([0-9]+).*/\\1\\2\\3/"`
    neededLuaVersion=`echo "$luaVersion" | sed -E "s/.*([0-9]+)\.([0-9]+)\.([0-9]+).*/\\1\\2\\3/"`
    if [ -f "$DIR/bin/lua" ] || ( [ -n "$curLuaVersion" ] && [[ $curLuaVersion -ge $neededLuaVersion ]] ); then
        echo "lua already installed"
    else
        readlineVersion="6.2"
        echo "Installing readline $readlineVersion"
        cd "$DIR"
        readlineDest="$DIR/readline.tar.gz"
        readlineSourceDir="$DIR/readline-$readlineVersion"

        wget -O "$readlineDest" "ftp://ftp.cwru.edu/pub/bash/readline-$readlineVersion.tar.gz"
        tar -zxf "$readlineDest"
        cd "$readlineSourceDir"

        ./configure --prefix="$DIR"
        make && make install

        rm -rf "$readlineSourceDir"
        rm -rf "$readlineDest"

        luaVersion="5.2.0"
        echo "installing lua $luaVersion"
        cd "$DIR"
        luaDest="$DIR/lua-$luaVersion.tar.gz"
        luaSourceDir="$DIR/lua-$luaVersion"

        wget -O "$luaDest" "http://www.lua.org/ftp/lua-$luaVersion.tar.gz"
        tar -zxf "$luaDest"
        cd "$luaSourceDir"

        luaTarget='linux'
        if [[ "$OSTYPE" == "darwin13" ]]; then
            luaTarget='macosx'
        fi
        make "$luaTarget" INSTALL_TOP="$DIR"
        make install INSTALL_TOP="$DIR"

        rm -rf "$luaSourceDir"
        rm -rf "$luaDest"

        export LUA_PREFIX="$DIR"
    fi

    vimsourcedir="$DIR/vim$neededVimVersion"

    if [ ! -d "$vimsourcedir" ]; then

        cd "$DIR"

        wget -O "$vimdest" "ftp://ftp.vim.org/pub/vim/unix/vim-$vimversion.tar.bz2"

        echo "Extracting..."
        tar -jxf "$vimdest"
        echo "Done."

        # mac only
        if [[ "$OSTYPE" == "darwin13" ]]; then
            patch "$vimsourcedir/src/os_unix.c" "vim_osx_fix.patch"
        fi
    fi

    # Installing Python 2.7

    pythonVersion="2.7.6"
    pythonVersionPrecise=`echo $pythonVersion | sed -E "s/([0-9]+)\.([0-9]+)\.([0-9])+/\\1\.\\2/"`

    echo "Installing python $pythonVersion"
    cd "$DIR"
    pythonDest="$DIR/python-$pythonVersion.tar.xz"
    pythonSourceDir="$DIR/Python-$pythonVersion"

    if [ -f "$DIR/bin/python2" ]; then
        echo "Python2 already installed"
        else
        echo "Installing Python2"
        wget -O "$pythonDest" "http://www.python.org/ftp/python/$pythonVersion/Python-$pythonVersion.tar.xz"
        tar --xz -xf "$pythonDest"
        cd "$pythonSourceDir"

        ./configure --prefix="$DIR"
        make && make install

        rm -rf "$pythonSourceDir"
        rm -rf "$pythonDest"
    fi

    cd "$vimsourcedir"
    ./configure --with-features=huge \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir="$DIR/lib/python$pythonVersionPrecise/config" \
        --enable-luainterp=yes \
        --enable-cscope \
        --disable-gpm \
        --with-tlib=ncurses \
        --prefix="$DIR" \
        --with-x=yes \
        --enable-acl \
        --disable-gui \
        --enable-multibyte
    make
    make install

    rm -Rf "$vimsourcedir"
    rm -Rf "$vimdest"
fi
#

cd "$DIR"

# ctags
if [ -f "$DIR/bin/ctags" ]; then
    echo "ctags already installed."
else
    echo "ctags will be installed."

    wget -O ctags.tar.gz "http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz"
    tar zxf ctags.tar.gz

    # fixing issue described here: http://dfrank.ru/ctags581
    patch -p1 < "$DIR/ctags_fix.patch"

    cd "ctags-5.8"

    ./configure --prefix="$DIR" \
                --disable-external-sort
    make && make install
    cd "$DIR"
    rm -Rf "ctags-5.8"
    rm -Rf "ctags.tar.gz"
fi
#

isAck=`ack --version 2>/dev/null`
# ack
if [ -n "$isAck" ] || [ -f "$DIR/bin/ack" ]; then
    echo "ack already installed."
else
    echo "ack will be installed."

    curl "http://beyondgrep.com/ack-2.12-single-file" > "$DIR/bin/ack" && chmod 0755 "$DIR/bin/ack"
fi
#

# TODO: auto init and update neobundle if its not

echo "Setting up environment..."

# dirs
mkdir -p "$DIR/tmp/vimswap"

# aliases
alias vim="vim -u \"$DIR/.vimrc\""

echo "Done."
