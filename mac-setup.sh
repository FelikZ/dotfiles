#!/bin/bash
############################

CWD="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# TODO: check and export once
# exports
if [[ ! "$PATH" =~ "$DIR/bin" ]]; then
    export PATH="$DIR/bin:$PATH"
fi

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

if [ -f "$DIR/bin/vim" ] || ( [ -n "$curVimVersion" ] && [[ $curVimVersion -ge $neededVimVersion ]] ); then
    echo "vim already installed."
else
    echo "installing vim $vimversion..."

    brew install python
    brew install lua52
    # Installing Vim
    brew install vim --with-features=huge \
        --with-lua \
        --with-python \
        --enable-rubyinterp=yes \
        --enable-pythoninterp=yes \
        --enable-luainterp=yes \
        --enable-cscope \
        --disable-gpm \
        --with-tlib=ncurses \
        --with-x=yes \
        --enable-acl \
        --disable-gui \
        --enable-multibyte
fi
#

source "./light-setup.sh"
