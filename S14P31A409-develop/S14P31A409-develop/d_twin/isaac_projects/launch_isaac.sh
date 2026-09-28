#!/bin/bash
# App Selector를 우회하여 현재 터미널에서 바로 실행 (bashrc 재실행 원천 차단)
unset AMENT_PREFIX_PATH
unset COLCON_PREFIX_PATH
unset ROS_PYTHON_VERSION
unset ROS_VERSION
unset PYTHONPATH
unset OLD_PYTHONPATH

export ROS_DISTRO=humble
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ISAAC_SIM_ROOT="${ISAAC_SIM_ROOT:-$HOME/isaac-sim}"
export LD_LIBRARY_PATH="$ISAAC_SIM_ROOT/exts/isaacsim.ros2.bridge/humble/lib"

cd "$ISAAC_SIM_ROOT" || exit 1
./isaac-sim.sh
