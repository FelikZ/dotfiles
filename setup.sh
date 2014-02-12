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

echo "Setting up environment..."
alias vim="vim -u $DIR/.vimrc"
echo "Done."
