#!/bin/bash
############################

CWD="$(pwd)"
if [ "$BASH_SOURCE" != "" ]
then
    DIR="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
elif [ "$DASH_SOURCE" != "" ]
then
    DIR="$( cd "$( dirname "$DASH_SOURCE" )" && pwd )"
else
    DIR="$( cd "$( dirname "$0" )" && pwd )"
fi
cd "$DIR"

# TODO: check and export once
# exports
if [[ ! "$PATH" =~ "$DIR/bin" ]]; then
    export PATH="$DIR/bin:$PATH"
fi

if [[ ! "$CPPFLAGS" =~ "$DIR/include" ]]; then
   export CPPFLAGS="-I$DIR/include"
fi

if [[ ! "$CPATH" =~ "$DIR/include" ]]; then
   export CPATH="$DIR/include/"
fi

if [[ ! "$LDFLAGS" =~ "$DIR/lib" ]]; then
    export LDFLAGS="-L$DIR/lib:$LDFLAGS"
    export LD_LIBRARY_PATH="$DIR/lib:$LD_LIBRARY_PATH"
fi

if [[ ! "$LIBRARY_PATH" =~ "$DIR/lib" ]]; then
    export LIBRARY_PATH="$DIR/lib/"
fi

if [[ ! "$LUA_PREFIX" =~ "$DIR" ]]; then
    export LUA_PREFIX="$DIR"
fi

# TODO: make custom ./configure and make file for installing vim and features
# TODO: params to install global / localy / standalone
# TODO: quite model
# TODO: fix: check libs not binaries!
# TODO: NeoBundle check before modules configure

cd "$DIR"

# ctags
if [ -f "$DIR/bin/ctags" ]; then
    echo "ctags already installed."
else
    echo "ctags will be installed."

    git clone "https://github.com/FelikZ/ctags" ctags

    cd "ctags"

    ./configure --prefix="$DIR" \
                --disable-external-sort
    make && make install
    cd "$DIR"
    rm -Rf "ctags"
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

cd "$DIR"

isAutoReconf=`autoreconf --version 2>/dev/null`
# Installing ag
if [ -f "$DIR/bin/ag" ]; then
    echo "AG installed"
else

    if [ -z "$isAutoReconf" ]; then
        echo "You need install 'dh-autoreconf' in order to install AG"
    else
        # Installing PCRE
        if [ -f "$DIR/lib/libpcre.so" ]; then
            echo "PCRE installed"
        else
            pcreVersion="8.34"

            echo "Installing pcre $pcreVersion"
            cd "$DIR"
            pcreDest="$DIR/pcre-$pcreVersion.tar.xz"
            pcreSourceDir="$DIR/pcre-$pcreVersion"
            wget -O "$pcreDest" "http://sourceforge.net/projects/pcre/files/pcre/$pcreVersion/pcre-$pcreVersion.tar.bz2/download"
            tar -jxf "$pcreDest"
            cd "$pcreSourceDir"

            ./configure --prefix="$DIR" \
                        --disable-cpp
            make
            make install

            rm -Rf "$pcreDest"
            rm -Rf "$pcreSourceDir"
        fi

        if [[ ! "$PCRE_LIBS" =~ "$DIR/lib/libpcre.a" ]]; then
            export PCRE_LIBS="$DIR/lib/libpcre.a"
        fi

        if [[ ! "$PATH" =~ "$DIR/include/pcre" ]]; then
            export PCRE_CFLAGS="-L$DIR/include/pcre"
        fi

        echo "Installing AG..."
        cd "$DIR"

        agSourceDir="$DIR/ag"
        rm -Rf "$agSourceDir"
        git clone "https://github.com/ggreer/the_silver_searcher.git" "$agSourceDir"

        cd "$agSourceDir"

        # git checkout 0.19.1

        autoreconf --install
        autoheader
        automake --add-missing
        ./configure --prefix="$DIR" --disable-zlib --disable-lzma
        make
        make install

        rm -Rf "$agSourceDir"
    fi
fi
#

# install vim if not detected
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
        cd "$DIR"

        ncursesVersion="5.9"
        ncursesDest="$DIR/ncurses.tar.gz"
        ncursesSourceDir="$DIR/ncurses-$ncursesVersion"


        wget -O "$ncursesDest" "http://ftp.gnu.org/pub/gnu/ncurses/ncurses-$ncursesVersion.tar.gz"

        tar -xf "$ncursesDest"

        cd "$ncursesSourceDir"

        ./configure --prefix="$DIR" \
                    --without-cxx
        make && make install

        rm -rf "$ncursesSourceDir"
        rm -rf "$ncursesDest"
    fi

    # Installing mosh

    # wget -O protobuf.tar.gz https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz
    # tar -zxf protobuf.tar.gz
    # cd "protobuf-2.5.0"
    # ./configure --prefix="$DIR"
    # make && make install
    #
    # export PKG_CONFIG_PATH="$DIR"
    # ./autogen.sh
    # ./configure --prefix="$DIR"
    # make && make install

    # export PERL5LIB=$PERL5LIB:"/home/sai/usr/local/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi"

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

    if [ -f "$DIR/bin/python" ] && [ -f "$DIR/bin/python2" ]; then
        echo "Python2 already installed"
    else
        echo "Installing Python2"
        wget --no-check-certificate -O "$pythonDest" "http://www.python.org/ftp/python/$pythonVersion/Python-$pythonVersion.tar.xz"
        tar --xz -xf "$pythonDest"
        cd "$pythonSourceDir"

        ./configure --prefix="$DIR"
        make && make install

        rm -rf "$pythonSourceDir"
        rm -rf "$pythonDest"
    fi

    cd "$DIR"

    # Installing Vim

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

    # cleanup
    rm -Rf "$vimsourcedir"
    rm -Rf "$vimdest"
    # rm -Rf "$DIR/include"
    # rm -Rf "$DIR/lib"
    # rm -Rf "$DIR/share/include"
    # rm -Rf "$DIR/share/lib"
    rm -Rf "$DIR/tmp"
fi
#

cd "$DIR"

# TODO: auto init and update neobundle if its not

echo "Setting up environment..."

# dirs
mkdir -p "$DIR/tmp/vimswap"

# files
echo '#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
exec $DIR/vim -u "$DIR/../.vimrc" "$@"' > "$DIR/bin/vimf"

# aliases
chmod 0777 "$DIR/bin/vimf"
alias vim="vimf"
export EDITOR="vimf"

cd "$CWD"

echo "Done."
