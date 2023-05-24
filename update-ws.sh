#!/usr/bin/env bash


source ~/.bashrc

cd ~/autoware
git pull
vcs import src < autoware.repos
vcs pull src



rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

while true; do
    read -p "Want to rebuild? (y/n)? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes (y or Y) or no (n or N).";;
    esac
done

while true; do
    read -p "Want to delete build/install/log folders beforehand? (y/n)? " yn

	if [[ $yn =~ ^[Yy]$ ]]
	then
		echo "Removing ..."
	    	rm -R build
		rm -R install
		rm -R log
		echo "Removing successful ..."
		echo "Building ..."
		colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
		echo "Building successful..."
		break
	else
		echo "Building ..."
		colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
		echo "Building successful..."
		break
	fi
done

echo "Script is completed ..."



