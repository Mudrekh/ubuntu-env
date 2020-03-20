#!/bin/bash

wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb
sudo apt install /tmp/zoom_amd64.deb -fy
