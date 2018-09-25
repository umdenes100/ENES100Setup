#!/bin/bash

# VS -> Vision System
# VSR -> Vision System Remote

VS_LINK="https://github.com/umdenes100/VisionSystem.git"
VSR_LINK="https://github.com/umdenes100/VisionSystemRemote.git"

apt update
apt upgrade

mkdir -p ~/Development && cd ~/Development

# Downloading repos.
git clone $VS_LINK
git clone $VSR_LINK
