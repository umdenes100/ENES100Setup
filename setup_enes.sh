#!/bin/bash

apt update
apt upgrade

# CORE PACKAGES - OPEN_CV, QT, ARUCO

# Setting up a Downloads folder if it doesn't already exist.
mkdir -p ~/Downloads

# Library links.
OPENCV_LINK="https://github.com/opencv/opencv.git"
OPENCV_CONTRIB_LINK="https://github.com/opencv/opencv_contrib.git"
QT_LINK="http://download.qt.io/official_releases/qt/5.11/5.11.0/qt-opensource-linux-x64-5.11.0.run"

# Pre-reqs
apt install build-essential -y
apt install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y

add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
apt update
apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper1 libjasper-dev libdc1394-22-dev -y
apt install v4l-utils
apt install unzip

# Downloading and Setting Up OpenCV
cd ~/Downloads
git clone $OPENCV_LINK && cd opencv && git checkout 3.4

# Downloading and Setting Up OpenCVContrib
cd ~/Downloads
git clone $OPENCV_CONTRIB_LINK && cd opencv_contrib && git checkout 3.4

# Installing OpenCV and OpenCVContrib
cd ~/Downloads
cd opencv-3.4.3 && mkdir build && cd build && cmake -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules .. && make install

# Installing QT5
cd ~/Downloads
wget $QT_LINK
chmod +x qt-opensource-linux-x64-5.11.0.run && ./qt-opensource-linux-x64-5.11.0.run

# Installing QT Add-Ons
apt install libfontconfig1 -y
apt install mesa-common-dev -y
apt install libglu1-mesa-dev -y
apt install libcanberra-gtk-module -y
apt install --no-install-recommends gnome-panel -y

# Adding enes100 user to USB access group.
usermod -a -G dialout enes100


apt update
apt upgrade

# ENES100 REPOS

# VS -> Vision System
# VSR -> Vision System Remote

VS_LINK="https://github.com/umdenes100/VisionSystem.git"
VSR_LINK="https://github.com/umdenes100/VisionSystemRemote.git"

mkdir -p ~/Development && cd ~/Development

# Downloading repos.
git clone $VS_LINK
git clone $VSR_LINK

cd ~/Downloads/ENES100Setup
cp ./resetCamera /bin/resetCamera
chmod +x /bin/resetCamera
resetCamera

cd ~
