#!/bin/bash

sudo apt install -y guake
mkdir -p ~/.config/autostart/
cat > ~/.config/autostart/guake.desktop << EOF
[Desktop Entry]
Type=Application
Exec=guake
X-GNOME-Autostart-enabled=true
Name=Guake
EOF