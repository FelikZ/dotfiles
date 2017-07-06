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

if [[ ! "$PATH" =~ "$DIR/bin" ]]; then
    export PATH="$DIR/bin:$PATH"
fi

cd "$DIR"

# dirs
mkdir -p "$DIR/tmp/vimswap"
mkdir -p "$DIR/bin"
if [ "$OSTYPE" = "linux-gnu" ]; then
    # Linux
    ln -sf "$DIR/scripts/linux/google-chrome.sh" "$DIR/bin/google-chrome-work"
elif [[ "$OSTYPE" =~ "darwin" ]]; then
    # Mac OSX
    ln -sf "$DIR/scripts/osx/google-chrome.sh" "$DIR/bin/google-chrome-work"
elif [ "$OSTYPE" = "cygwin" ]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    true
elif [ "$OSTYPE" = "msys" ]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    true
elif [ "$OSTYPE" = "win32" ]; then
    true
    # I'm not sure this can happen.
elif [[ "$OSTYPE" =~ "freebsd" ]]; then
    # ...
    true
else
    # Unknown.
    true
fi

# files
echo '#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIMLOC="$(which vim)"
exec $VIMLOC -u "$DIR/../.vimrc" "$@"' > "$DIR/bin/vimf"

# aliases
chmod 0777 "$DIR/bin/vimf"
alias vim="vimf"
export EDITOR="vimf"

cd "$CWD"
