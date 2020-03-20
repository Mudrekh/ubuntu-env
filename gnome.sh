#!/bin/bash

sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
sudo chmod +x /usr/local/bin/gnomeshell-extension-manage

sudo apt install -y gnome-tweak-tool
sudo apt install -y gnome-shell-extensions
sudo apt install -y chrome-gnome-shell

gnomeshell-extension-manage --install --extension-id 1485 # Workspace Matrix
gnomeshell-extension-manage --install --extension-id 28 #gTile
