#!/usr/bin/env bash
# Set up pcan driver und pcan-basic api

# Install Prerequisites
sudo apt install linux-headers-`uname -r` libpopt-dev g++

cd ~
mkdir drivers
cd drivers

wget -qO- https://www.peak-system.com/quick/PCAN-Linux-Driver | tar xvz 
wget -qO- https://www.peak-system.com/quick/BasicLinux | tar xvz 

# Install PCAN-Driver

cd peak-linux-driver-*
make clean all
make 
sudo make install

cd ..

# Install PCAN-Basic API Library

cd PCAN-Basic_Linux-*/libpcanbasic/pcanbasic
make clean 
make
sudo make install

# Install PCANView
wget -q http://www.peak-system.com/debian/dists/`lsb_release -cs`/peak-system.list -O- | sudo tee /etc/apt/sources.list.d/peak-system.list
wget -q http://www.peak-system.com/debian/peak-system-public-key.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install pcanview-ncurses

echo -e "Completed."
exit 0

