#!/bin/bash

# https://github.com/creationix/nvm#install-script
NVM_URL="https://raw.githubusercontent.com/creationix/nvm/master/install.sh"

# nvm, node and modules
wget -qO- $NVM_URL | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 10
nvm use 10
nvm alias default 10