---
title: "Install Robot Operating System (ROS) Hydro on Ubuntu 12.04 LTS (Precise)"
author: "MakerStan"
created: "March 27, 2014"
edited: "March 31, 2014"
layout: "default"
isPage: true
preview: "Install ROS (Hydro) on Ubuntu 12.04 LTS (Precise). I picked this version of Ubuntu since it has long term support till April, 2017. I picked ROS Hydro since that has the best integration with Gazebo Robot Simulator."
---
The recommended full desktop install of Robot Operating System [(ROS)](http://www.ros.org/) takes around 2GB of space. This is what I got when I ran <code>sudo apt-get install ros-hydro-desktop-full</code>:
<pre>
0 upgraded, 750 newly installed, 0 to remove and 10 not upgraded.
Need to get 808 MB of archives.
After this operation, **2,041 MB** of additional disk space will be used.
Do you want to continue [Y/n]? 
</pre>
I selected 'No' to the following question that showed up during the install
<pre>Should the hddtemp daemon be started at boot?</pre>
If you are also interested in installing the Gazebo Simulator for ROS, please see this post: [install-gazebo-ros-on-ubuntu-precise.html](install-gazebo-ros-on-ubuntu-precise.html)

Run the following scripts to setup sources, keys, install and setup the environment.
<gist>9862679?file=install-ros-hydro-on-ubuntu-precise.sh</gist>

I ran this command to for a basic check to see if ROS was installed correctly: <code>rospack find opencv2</code>

If you plan to use [Gazebo Simulator](http://gazebosim.org/) with ROS, please see [this post](install-gazebo-ros-on-ubuntu-precise.html)

**External Links**
1. Click this link for detailed instructions: [http://wiki.ros.org/hydro/Installation/Ubuntu](http://wiki.ros.org/hydro/Installation/Ubuntu)
