#!/bin/bash

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -o /tmp/awscliv2.zip -d /tmp/

which aws && UPDATE="--update" || UPDATE=""
sudo /tmp/aws/install $UPDATE
