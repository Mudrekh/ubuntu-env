#!/bin/bash

DISCORD_URL="https://discordapp.com/api/download?platform=linux&format=deb"
TGT_DOWNLOAD_FILE="discord.deb"

wget -O /tmp/$TGT_DOWNLOAD_FILE $DISCORD_URL
sudo apt install /tmp/$TGT_DOWNLOAD_FILE -yf
