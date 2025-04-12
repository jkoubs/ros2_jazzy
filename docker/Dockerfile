ARG BASE_IMAGE=osrf/ros
ARG BASE_TAG=jazzy-desktop

FROM ${BASE_IMAGE}:${BASE_TAG}

ENV DEBIAN_FRONTEND=noninteractive
ARG DISTRO=jazzy
SHELL ["/bin/bash", "-c"]

# dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y git && \
    apt-get install -y build-essential \
                       terminator \
                       nano \
                       vim \
                       python3-pip \
                       libeigen3-dev \
                       tree \
                       wget \
                       bash-completion \
                       gedit \
                       ros-${DISTRO}-nav2-simple-commander \
                       ros-${DISTRO}-plotjuggler \
                       ros-${DISTRO}-ros-gz \
                       ros-${DISTRO}-xacro \
                       ros-${DISTRO}-joint-state-publisher \
                       ros-${DISTRO}-joint-state-publisher-gui \
                       ros-${DISTRO}-gz-ros2-control \
                       ros-${DISTRO}-teleop-twist-joy \
                       ros-${DISTRO}-joy \
                       ros-${DISTRO}-pinocchio \
                       ros-${DISTRO}-ros2-control \
                       ros-${DISTRO}-ros2-controllers \
                       ros-${DISTRO}-xacro \
                       ros-${DISTRO}-rosbag2-storage-mcap \
                       ros-${DISTRO}-plotjuggler-ros \
                       ros-${DISTRO}-rviz2 \
                       ros-${DISTRO}-rmw-cyclonedds-cpp \
                       qtbase5-dev \
                       libqt5svg5-dev \
                       libzmq3-dev \
                       libdw-dev
                       
RUN apt-get -y dist-upgrade
#RUN pip3 install transforms3d

# Gazebo Harmonic Install
RUN apt-get install -y  curl lsb-release gnupg
RUN curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg 
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN echo " CURL DONE"

RUN   apt-get update 
RUN  apt-get install -y gz-harmonic
RUN echo "Ignition Installed"
RUN apt-get update
RUN apt-get upgrade -y

# Create env_ws containing Groot
# RUN mkdir -p /env_ws/src

# Source automatically the underlay (all necessary setup to run ROS2) (add it to .bashrc file)
RUN echo "source /opt/ros/${DISTRO}/setup.bash" >> ~/.bashrc
# Source automatically the overlay (workspace -> env_ws) (add it to .bashrc file)
# RUN echo "source /env_ws/install/setup.bash" >> ~/.bashrc
RUN echo "export GZ_SIM_SYSTEM_PLUGIN_PATH=/opt/ros/${DISTRO}/lib/" >> ~/.bashrc

COPY ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

# Set Working directory
WORKDIR '/'
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]