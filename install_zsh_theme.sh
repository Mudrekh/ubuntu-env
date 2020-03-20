#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

/bin/cp -af $SCRIPTPATH/zsh/zsh_theme/. ~/.zsh_theme
/bin/cp -af $SCRIPTPATH/zsh/zshrc ~/.zshrc
/bin/cp -af $SCRIPTPATH/zsh/zshenv ~/.zshenv
