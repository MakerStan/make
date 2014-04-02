---
title: "Install Gazebo Simulator (v1.9) for Robot Operating System (ROS)  on Ubuntu 12.04 LTS (Precise)"
author: "MakerStan"
created: "March 27, 2014"
edited: "March 31, 2014"
layout: "default"
isPage: true
preview: "Install Gazebo Simulator (v1.9) for Robot Operating System (ROS) on Ubuntu 12.04 LTS (Preceise). I picked this version of Ubuntu since it has long term support till April, 2017. I picked Gazebo 1.9 since that has the best integration with ROS."
---

If you are interested in using the [Gazebo Simulator](http://gazebosim.org/) with Robot Operating System [(ROS)](http://www.ros.org/), please insgtall ROS first using instructions [here](install-ros-hydro-on-ubuntu-precise.html).

NOTE: If you installed the full desktop version of ROS, then Gazebo is installed along with it and you can skip the install steps below and jump to the verification step.

Run the following scripts to setup sources, keys, install and setup the environment
<pre>
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu precise main" > /etc/apt/sources.list.d/gazebo-latest.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install gazebo
</pre>
Here is the [raw](https://gist.githubusercontent.com/MakerStan/9862679/raw/install-gazebo-ros-on-ubuntu-precise.sh) version of the script above.

Check your installation using the following.
<pre>
gzserver # This will start the server
gzclient # This will start the GUI
gazebo # This command should openup a GUI if Gazebo was installed correctly.
</pre>
Here is the [raw](https://gist.githubusercontent.com/MakerStan/9862679/raw//check-gazebo-install.sh) version of the script above.

For Gazebo with ROS, do the following.
<pre>
sudo apt-get install ros-hydro-gazebo-ros-pkgs ros-hydro-gazebo-ros-control
</pre>
Here is the [raw](https://gist.githubusercontent.com/MakerStan/9862679/raw//install-gazebo-ros.sh) version of the script above.

**External Links**
1. Click [this link](http://gazebosim.org/wiki/1.9/install) for detailed instructions on Gazebo installation.
2. Click [this link](http://gazebosim.org/wiki/Tutorials/1.9/Installing_gazebo_ros_Packages) for Gazebo with ROS.
