#!/bin/bash
# Install Robot Operating System (ROS) on NVIDIA Jetson TX2
# Maintainer of ARM builds for ROS is http://answers.ros.org/users/1034/ahendrix/
# Information from:
# http://wiki.ros.org/melodic/Installation/UbuntuARM

# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
# Installation
sudo apt update
sudo apt install ros-melodic-ros-base -y
# Add Individual Packages here
# You can install a specific ROS package (replace underscores with dashes of the package name):
# sudo apt-get install ros-melodic-PACKAGE
# e.g.
# sudo apt-get install ros-melodic-navigation
#
# To find available packages:
# apt-cache search ros-melodic
# 
# Initialize rosdep
sudo apt install python-rosdep -y
# Certificates are messed up on the Jetson for some reason
sudo c_rehash /etc/ssl/certs
# Initialize rosdep
sudo rosdep init
# To find available packages, use:
rosdep update
# Environment Setup - Don't add /opt/ros/melodic/setup.bash if it's already in bashrc
grep -q -F 'source /opt/ros/melodic/setup.bash' ~/.bashrc || echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# Install rosinstall
sudo apt install python-rosinstall -y
#setup ROS environment variables
grep -q -F ' ROS_MASTER_URI' ~/.bashrc ||  echo 'export ROS_MASTER_URI=http://localhost:11311' | tee -a ~/.bashrc
grep -q -F ' ROS_IP' ~/.bashrc ||  echo "export ROS_IP=$(hostname -I)" | tee -a ~/.bashrc
# echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> ~/.bashrc

