#!/bin/bash
############################
#echo $(readlink -f $(dirname ${BASH_SOURCE[0]}))
#DIR="$( cd "$( dirname "$0" )" && pwd )"
#DIR=$(readlink -f $(dirname ${BASH_SOURCE[0]}))

TARGET_FILE=$(dirname ${BASH_SOURCE[0]})

cd `dirname $TARGET_FILE`
TARGET_FILE=`basename $TARGET_FILE`

# Iterate down a (possible) chain of symlinks
while [ -L "$TARGET_FILE" ]
do
    TARGET_FILE=`readlink $TARGET_FILE`
    cd `dirname $TARGET_FILE`
    TARGET_FILE=`basename $TARGET_FILE`
done

# Compute the canonicalized name by finding the physical path
# for the directory we're in and appending the target file.
PHYS_DIR=`pwd -P`
DIR=$PHYS_DIR/$TARGET_FILE

echo $DIR
echo "Setting up environment..."
alias vim="vim -u $DIR/.vimrc"
echo "vim -u $DIR/.vimrc"
echo "Done."
