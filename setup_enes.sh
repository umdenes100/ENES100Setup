#!/bin/bash

OPENCV_LINK="https://github.com/opencv/opencv/archive/3.4.1.zip"
ARUCO_LINK="https://downloads.sourceforge.net/project/aruco/3.0.0/aruco-3.0.9.zip"

apt-get update
apt-get upgrade

apt-get install build-essential
apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

apt-get install unzip

cd ~/Downloads
wget $OPENCV_LINK && unzip 3.4.1.zip && rm 3.4.1.zip
cd opencv-3.4.1/build && cmake .. && make install

cd ~/Downloads
wget $ARUCO_LINK && unzip aruco-3.0.9.zip && rm aruco-3.0.9.zip
cd aruco-3.0.9 && mkdir build && cd build && cmake .. && make install

cd ~/Downloads