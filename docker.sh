#! /bin/bash

curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo bash /tmp/get-docker.sh

sudo usermod -aG docker $USER
