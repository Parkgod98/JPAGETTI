# 🌐 디지털 트윈

[🐾 프로젝트 홈](../README.md) · [📖 Wiki](../docs/wiki/Home.md)

---

- `ros2/planning/global_path_manager`: 지도 설정을 읽어 로봇별 전역 경로를 생성·발행.
- `ros2/planning/sar_planner`: 지도 입력 UI 및 정찰 경로 관련 코드.
- `ros2/simulation/sim_executor`: 모의 로봇 경로 추종·UDP 데이터 송신.
- `isaac_projects/scenes`: Isaac Sim 씬.
- `scripts`: Isaac Sim Script Node 코드.

## 환경과 빌드

기존 문서는 Isaac Sim 5.1.0 및 내장 Python 3.11을 기준으로 작성돼 있습니다.
설치본의 Python ABI와 ROS 메시지 바인딩을 직접 확인해야 합니다.
`robot_ws_311`은 이 저장소에 포함돼 있지 않습니다.

ROS 2 Humble 환경에서 별도 작업 디렉터리를 만들고:

```bash
source /opt/ros/humble/setup.bash
mkdir -p "$HOME/spot-twin-ws"
cd "$HOME/spot-twin-ws"
rosdep install --from-paths "$PROJECT_ROOT/d_twin/ros2" "$PROJECT_ROOT/robot_ws/src/interfaces" --ignore-src -r -y
colcon build --base-paths "$PROJECT_ROOT/d_twin/ros2" "$PROJECT_ROOT/robot_ws/src/interfaces" --symlink-install
source install/setup.bash
```

이 절차는 ROS 패키지 빌드용이며 Isaac Sim 내장 Python 호환 바인딩을 자동으로 만들지 않습니다.
모의 실행용 영상 경로와 수신 IP를 먼저 설정한 뒤 별도 터미널에서 실행합니다.

```bash
ros2 launch global_path_manager global_path_manager.launch.py
ros2 launch sim_executor sim_executor.launch.py
```

Isaac Sim은 `ISAAC_SIM_ROOT`로 설치 위치를 지정하여 `isaac_projects/launch_isaac.sh`를 실행합니다.
씬의 Script Node 경로, `scripts/robot_localization.py`의 메시지 라이브러리 경로,
`sim_executor_script.py`의 영상·IP 설정은 설치 환경에 맞춰 확인해야 합니다.
실제 시뮬레이터 실행은 이번 정리에서 검증하지 않았습니다.
