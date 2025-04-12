# ros2_jazzy

## Create a Docker container that will launch turtlebot3 simulations in ROS2 Jazzy from a linux host computer.

We need to create 2 files:

- <strong>Dockerfile</strong>: Used to build images and add dependencies needed 
- <strong>docker-compose.yml</strong>: Used to run the container

Open a new terminal and git clone the repository:
```bash
git clone https://github.com/jkoubs/ros2_jazzy.git
```

Then build the image that we will name <strong>jazzy_env</strong>:
```bash
cd ros2_jazzy/docker
docker build -f Dockerfile -t jazzy_env .
```

Next we will create the container:

<u><strong><em>Requirement</em></strong></u> : To run GUI applications in Docker on Linux hosts, you have to run <strong>"xhost +local:root"</strong>. To disallow, <strong>"xhost -local:root"</strong>. For Windows and Mac hosts please check : [Running GUI applications in Docker on Windows, Linux and Mac hosts](https://cuneyt.aliustaoglu.biz/en/running-gui-applications-in-docker-on-windows-linux-mac-hosts/). Can also found some more information about [Using GUI's with Docker](http://wiki.ros.org/docker/Tutorials/GUI).

```bash
xhost +local:root
```

We can now run the image as a container named <strong>jazzy_env_container</strong> using docker-compose :

```bash
docker-compose up
```
<u><strong><em>Note</em></strong></u>: We are using terminator which is a linux terminal emulator, to split a terminal horizontally press "<strong>Ctrl + Shift + O</strong>" et vertically press "<strong>Ctrl + Shift + E</strong>"

We are now <strong>inside the container</strong>. We can start launching the turtlebot3 simulations:


```bash
# Launch the simulation 
ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
