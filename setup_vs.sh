#!/bin/bash

# VS -> Vision System
# VSR -> Vision System Remote
# VSRC -> Vision System Remote Client

VS_LINK="https://github.com/umdenes100/VisionSystem.git"
VSR_LINK="https://github.com/umdenes100/VisionSystemRemote.git"
VSRC_LINK="https://github.com/umdenes100/VisionSystemRemoteClient.git"

apt-get update
apt-get upgrade

mkdir -p ~/Development && cd ~/Development

# Downloading repos.
git clone $VS_LINK
git clone $VSR_LINK
git clone $VSRC_LINK

# Setting up log directories.
cd VisionSystemRemoteClient && mkdir logs && cd logs
touch access.log && touch error.log

# Setting up nginx.
cp ./nginx_conf /etc/nginx/sites-available/VisionSystemRemoteClient
ln -s /etc/nginx/sites-available/VisionSystemRemoteClient /etc/nginx/sites-enabled/VisionSystemRemoteClient

nginx -s reload

# Add port to groups.

