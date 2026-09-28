# 🎮 실행·운용

> **준비 순서: 빌드 → 장비 설정 → 구성 실행 → 데이터 확인**

## 01 · ROS 환경 불러오기

각 터미널에서 소스 루트 기준 `PROJECT_ROOT`를 설정하고 빌드 결과를 불러옵니다.

```bash
source /opt/ros/humble/setup.bash
source "$PROJECT_ROOT/robot_ws/install/setup.bash"
```

## 02 · 로봇 구성 실행

| 구성 | 명령 |
| --- | --- |
| UART 브리지만 실행 | `ros2 launch actuator_bridge actuator_bridge.launch.py` |
| 통합 보행 구성 | `ros2 launch robot_bringup rl_motion_manager.launch.py` |
| 카메라 구성 | `ros2 launch robot_bringup camera.launch.py` |
| 로컬 경로 파이프라인 | `ros2 launch spot_navigation final_local_path_pipeline.launch.py` |
| 위치·경로·LiDAR 송신 | `ros2 launch network_bringup network_bringup.launch.py` |

통합 보행 런치에는 UART 브리지가 포함됩니다. 동일 브리지를 중복 실행하지 않습니다.
위 명령들은 구성별 진입점입니다. 필요한 센서·측위·정책과 설정이 준비된 상태에서 조합합니다.

## 03 · 관제 실행

먼저 브리지 데몬을 실행합니다.

```bash
cd "$PROJECT_ROOT/rpi/bridge_app"
./bridge_daemon 4
```

다른 터미널에서 대시보드를 실행합니다.

```bash
cd "$PROJECT_ROOT/rpi/qt_app"
./build/DisasterControlQt
```

인자 `4`는 관리할 로봇 수입니다. 실제 구성에 맞게 지정합니다.
공유메모리는 `/robot_bridge_N` 형식으로 생성되며, 송신 측 robot_id와 맞춰야 합니다.

## 04 · 동작 모드

| 모드 | 의미 |
| --- | --- |
| `STAND` | 서기 목표 |
| `SIT` | 앉기 목표 |
| `CLASSIC` | 고전 제어 보행 |
| `RL` | 강화학습 보행 정책 |
| `DETECT` | 탐지 모션 시퀀스 |

<details>
<summary><b>동작 명령 예시 펼치기</b></summary>

실제 로봇이 움직이는 명령입니다. UART·모션 노드·관절 설정 및 시험 공간을 확인한 뒤 사용합니다.
현재 펌웨어의 `IN_HAND_MODE=1`은 시험용 자세 한계 설정입니다.

```bash
# 서기
ros2 topic pub --once /control/behavior/mode std_msgs/msg/String '{data: STAND}'

# 고전 제어 모드
ros2 topic pub --once /control/behavior/mode std_msgs/msg/String '{data: CLASSIC}'

# 전진 명령 예시: 발행 중 실제 보행 가능
ros2 topic pub -r 20 /control/cmd_vel/spot_01 geometry_msgs/msg/Twist \
  '{linear: {x: 0.10}, angular: {z: 0.0}}'

# 별도 터미널에서 앉기 모드 선택
ros2 topic pub --once /control/behavior/mode std_msgs/msg/String '{data: SIT}'
```

Classic 제어에는 명령 타임아웃 설정이 있습니다. 발행 중단에 따른 처리와
STM32 통신 stale 처리는 별개이며, 이를 검증된 비상정지 절차로 간주하지 않습니다.

</details>

## 05 · 경로 계획과 디지털 트윈

디지털 트윈 워크스페이스 환경을 불러온 별도 터미널에서 실행합니다.

```bash
source "$HOME/spot-twin-ws/install/setup.bash"
ros2 launch global_path_manager global_path_manager.launch.py
```

다른 터미널에서 모의 실행 노드를 시작합니다.

```bash
source "$HOME/spot-twin-ws/install/setup.bash"
ros2 launch sim_executor sim_executor.launch.py
```

Isaac Sim 실행 스크립트:

```bash
bash "$PROJECT_ROOT/d_twin/isaac_projects/launch_isaac.sh"
```

씬의 Script Node와 ROS 메시지 바인딩, 영상 파일 경로를 확인합니다.
독립 송신 스크립트 `d_twin/scripts/sim_executor_script.py`는 별도 실행 경로입니다.

## 06 · 데이터 확인

```bash
ros2 node list
ros2 topic list
ros2 topic echo --once /planning/global_path/spot_01
```

노드 존재 → 토픽 데이터 → 네트워크 수신 → 대시보드 표시 순으로 확인하면 문제 범위를 좁힐 수 있습니다.

---

[🏠 Wiki 홈](Home.md) · [← ⚙️ 설정](Configuration.md) · [🔧 트러블슈팅 →](Troubleshooting.md)
