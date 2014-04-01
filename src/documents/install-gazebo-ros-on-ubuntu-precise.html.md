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
<gist>9862679?file=install-gazebo-ros-on-ubuntu-precise.sh</gist>

Check your installation using the following.
<gist>9862679?file=check-gazebo-install.sh</gist>

For Gazebo with ROS, do the following.
<gist>9862679?file=install-gazebo-ros.sh</gist>

**External Links**
1. Click [this link](http://gazebosim.org/wiki/1.9/install) for detailed instructions on Gazebo installation.
2. Click [this link](http://gazebosim.org/wiki/Tutorials/1.9/Installing_gazebo_ros_Packages) for Gazebo with ROS.
