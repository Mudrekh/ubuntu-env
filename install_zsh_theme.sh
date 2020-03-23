#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

/bin/cp -af $SCRIPTPATH/zsh/zsh_theme/. ~/.zsh_theme
/bin/cp -af $SCRIPTPATH/zsh/zshrc ~/.zshrc
/bin/cp -af $SCRIPTPATH/zsh/zshenv ~/.zshenv

# Pulled from zshrc 
ZSH_CUSTOM=$HOME/.zsh_theme
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
