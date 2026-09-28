# 🤖 Jetson · ROS 2

[🐾 프로젝트 홈](../README.md) · [📖 Wiki](../docs/wiki/Home.md)

---

Jetson Orin Nano를 대상으로 작성한 ROS 2 Humble 워크스페이스입니다.
기존 기준 환경은 Ubuntu 22.04 aarch64입니다.

`src/` 아래에 bringup, control, experimenter, interfaces, localization,
navigation, network, perception, vendor 패키지가 있습니다.
인터페이스 정의는 `src/interfaces/robot_interfaces`에 있습니다.

## 빌드

루트 README에서 `PROJECT_ROOT`를 설정한 뒤:

```bash
source /opt/ros/humble/setup.bash
cd "$PROJECT_ROOT/robot_ws"
rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install
source install/setup.bash
```

ROS 2, rosdep, colcon을 먼저 설치해야 합니다. 패키지 선언만으로 TensorRT,
ONNX Runtime, 카메라·LiDAR 외부 드라이버까지 준비된다고 가정하지 마세요.
이번 공개 정리에서는 ROS 빌드를 수행하지 않았습니다.

## 실행 진입점

- `ros2 launch robot_bringup rl_motion_manager.launch.py`: RL·고전제어·모션 mux·UART 브리지 구성.
- `ros2 launch robot_bringup camera.launch.py`: 카메라 구성.
- `ros2 launch spot_navigation final_local_path_pipeline.launch.py`: 로컬 경로 파이프라인.
- `ros2 launch network_bringup network_bringup.launch.py`: 위치·경로 및 LiDAR 송신.

장비·정책·센서 설정 후 필요한 구성만 실행합니다. 이 명령들은 파일 존재와 구성을 확인한
진입점이며 이 환경에서 실제 구동한 결과가 아닙니다.
`control_core.launch.py`, `hardware_stand.launch.py`, `hardware_rl_low_speed.launch.py`는 빈 파일입니다.

IP와 경로 설정은 [설정 문서](../docs/wiki/Configuration.md)를 참고하세요.
