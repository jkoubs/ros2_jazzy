#!/bin/bash
set -e  # This was causing Docker to exit when auto-filling or running into error

. "/opt/ros/jazzy/setup.bash"
# . "/env_ws/install/setup.bash"
# Source Gazebo Harmonic setup script
#. "/usr/share/gz/setup.sh"
# Ensure the GZ_SIM_SYSTEM_PLUGIN_PATH is set
export GZ_SIM_SYSTEM_PLUGIN_PATH="/opt/ros/jazzy/lib/"

exec "$@"
