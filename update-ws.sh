#!/usr/bin/env bash


source ~/.bashrc

cd ~/autoware
git pull
vcs import src < autoware.repos
vcs pull src



rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

while true; do
    read -p "Want to rebuild? (y/n)?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


rm -R build
rm -R install
rm -R log

colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
