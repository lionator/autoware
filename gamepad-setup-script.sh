cd $HOME
sudo rm -R libgamepad
git clone https://github.com/univrsal/libgamepad
cd libgamepad
mkdir build && cd build
cmake ..
make
sudo make install

echo -e "Completed."
exit 0