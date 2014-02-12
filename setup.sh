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

str=$(type -t ctags)
# ctags
if [ ! -z "$str" -a "$str" != " " ] || [ -f "$DIR/bin/ctags" ]; then
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

echo "Setting up environment..."

# aliases
alias vim="vim -u $DIR/.vimrc"

# exports
export PATH="$DIR/bin:$PATH"

echo "Done."
