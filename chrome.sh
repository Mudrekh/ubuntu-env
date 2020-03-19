#!/bin/bash

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb
sudo apt install /tmp/google-chrome-stable_current_amd64.deb -y

# Set Chrome as default browser
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /usr/bin/google-chrome-stable 200