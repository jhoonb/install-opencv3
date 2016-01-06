#!/bin/bash

#
# vagrant box, ubuntu (15.04 - 64): [notice] with Python3 > !!
# https://cloud-images.ubuntu.com/vagrant/vivid/current/
#
# -> ppa for python3.5 and java
# -> update and upgrade
# -> Install essentials
# -> upgrade pip3
# -> install python libs
# -> create dir bin
# -> download opencv from github
# -> download opencv_contrib from github
# -> create dir bin/opencv/build for compile
# -> compile with cmake
# -> make opencv
# -> test opencv with python3 "import cv2"
#

# if you need change the layout keyboard run:
# sudo dpkg-reconfigure keyboard-configuration
# then, run:
# sudo dpkg-reconfigure console-setup
# :)

LINE="==============================================="

# ppa add for python 3.5
sudo add-apt-repository ppa:fkrull/deadsnakes
# ppa add for java
sudo add-apt-repository ppa:webupd8team/java

echo $LINE
sudo apt-get update -y && sudo apt-get upgrade -y

# configure libs
# insert here
INSTALL_PKGS=('build-essential' 'libatlas-base-dev' 'gfortran'
'cmake' 'git' 'libjpeg8-dev'  'libtiff5-dev'
'libjasper-dev' 'libpng12-dev' 'libavcodec-dev'
'libavformat-dev' 'libswscale-dev' 'libv4l-dev'
'libgtk2.0-dev' 'python3.4-dev' 'python3.5-dev'
'libpython3.4-dev' 'libpython3.5-dev' 'python3-all-dev' 'python3-pip'
'python3-numpy' 'python3-scipy' 'oracle-java8-set-default')

# configure python libs
# insert here
PYTHON_DRIVERS=('matplotlib')

# get len
NUM_INSTALL=${#INSTALL_PKGS[@]}

NUM_PYTHON=${#PYTHON_DRIVERS[@]}

# install pkgs
echo $LINE
echo "Packages: "

for (( i = 0; i < $NUM_INSTALL; i++)); do
    echo $LINE
    sudo apt-get install ${INSTALL_PKGS[${i}]} -y
done

# upgrade pip3
sudo pip3 install --upgrade pip

# install python libs
echo $LINE
echo "Python libs: "

for (( i = 0; i < $NUM_PYTHON; i++)); do
    echo $LINE
    sudo pip3 install ${PYTHON_DRIVERS[${i}]}
done

# create folder bin and enter on folder
echo $LINE
echo "create folder /bin "
mkdir /home/vagrant/bin/
echo "enter on folder: "
cd /home/vagrant/bin

# download opencv from github repository
# download in dir /home/vagrant/bin/
echo $LINE
echo "download opencv from github: "
echo $LINE
git clone https://github.com/Itseez/opencv.git

# download opencv_contrib from github repository
# download in dir /home/vagrant/bin/
echo $LINE
echo "download opencv_contrib from github: "
echo $LINE
git clone https://github.com/Itseez/opencv_contrib.git

# enter on folder opencv
echo $LINE
cd opencv
# create a new folder "build"
mkdir build
# enter on folder build
cd build
# execute cmake
echo "building opencv..."
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=/home/vagrant/bin/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..

echo $LINE
echo "opencv make: "

# maybe need change...
# -j4 e.x: -j8
make -j4

echo $LINE
echo "opencv make install: "
sudo make install
sudo ldconfig

# print paths
echo "opencv local /home/vagrant/bin/opencv"
echo "opencv_contrib local /home/vagrant/bin/opencv_contrib"

# test python3 lib opencv
echo "Create a python file for test"
txt="import datetime as dt;import cv2; print('TIME:', dt.datetime.now()); print('opencv version: ', cv2.__version__)"
echo $txt > test.py

time python3 test.py

# go to home folder
cd /home/vagrant/
