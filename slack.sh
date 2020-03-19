#!/bin/bash

SLACK_VERSION="slack-desktop-4.3.2-amd64.deb"
wget https://downloads.slack-edge.com/linux_releases/$SLACK_VERSION -O /tmp/$SLACK_VERSION
sudo apt install /tmp/$SLACK_VERSION -y
