#!/bin/bash
############################

CWD="$(pwd)"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ ! "$PATH" =~ "$DIR/bin" ]]; then
    export PATH="$DIR/bin:$PATH"
fi

cd "$DIR"

echo "Setting up environment..."

# dirs
mkdir -p "$DIR/tmp/vimswap"

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

echo "Done."
