# docker-ros-desktop

Quickly setup a Dockerized ROS Desktop environment

## Dependencies

- docker

## Usage

First, build the image:

```shell
./build-image.sh
```

Then, you can start a shell to the ROS environment:

```shell
./run-ros-desktop.sh
```

Your workspace is located under `/catkin_ws`.

From here, you can proceed to [Create a ROS Workspace](https://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment#Create_a_ROS_Workspace).
