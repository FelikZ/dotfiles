export PATH="/usr/local/opt/protobuf@2.6/bin:$PATH"
export PATH="/usr/local/opt/node@6/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

eval "$(jenv init - --no-rehash)"
# (jenv rehash &) 2> /dev/null

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh" # This loads nvm
