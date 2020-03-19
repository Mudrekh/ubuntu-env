#!/bin/bash

wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O /tmp/gitkraken-amd64.deb
sudo apt install gconf2
sudo dpkg -i /tmp/gitkraken-amd64.deb
