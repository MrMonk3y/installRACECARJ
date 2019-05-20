#!/bin/bash
# Install the MIT RACECAR software
# This is for NVIDIA Jetson L4T 28.2.1
# This will install the whole software stack for the MIT RACECAR
# Includes ROS installation

# Setup the UDEV rules for the ESC and IMU
./scripts/installRACECARUdev.sh
# Install ROS
./scripts/installROS.sh
# Then setup the Catkin Workpsace for the RACECAR
./scripts/setupCatkinWorkspace.sh racecar-ws
# One of the dependencies is missing, opencv3 for ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
#sudo apt-get install ros-melodic-opencv3 -y
sudo apt install ros-melodic-desktop-full -y
#sudo apt-get install ros-melodic-opencv3 -y
# And now install the MIT RACECAR packages
./scripts/installMITRACECAR.sh racecar-ws
# Print out a little info at the end
./scripts/echoInfo.sh
echo "The RACECAR Packages should now be installed in the directory racecar-ws"
echo " " 



