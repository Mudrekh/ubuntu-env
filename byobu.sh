#!/bin/bash

sudo apt install byobu -y
byobu-enable

cat > ~/.byobu/.tmux.conf << BYOBU_CONF
set -g default-shell   /usr/bin/zsh
set -g default-command /usr/bin/zsh
BYOBU_CONF