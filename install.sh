echo "==============================================="
echo "install: packages and libs for opencv on linux"
echo "cmake and git"
sudo apt-get install build-essential cmake git pkg-config
echo "==============================================="
echo "install lib for png, jpeg and jasper"
sudo apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
echo "==============================================="
echo "install codecs"
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
echo "==============================================="
echo "install gtk2 dev"
sudo apt-get install libgtk2.0-dev
echo "==============================================="
echo "install python3.4 and python3.5 lib and dev mode"
sudo apt-get install python3.4-dev
sudo apt-get install python3.5-dev
sudo apt-get install libpython3.4-dev
sudo apt-get install libpython3.5-dev
echo "==============================================="
echo "install pip on python3"
sudo apt-get install python3-pip
echo "==============================================="
echo "install Python libs."
sudo pip3 install numpy
