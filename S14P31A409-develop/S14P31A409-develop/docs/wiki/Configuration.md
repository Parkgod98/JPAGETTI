# ⚙️ 장비별 설정

> **네트워크 · 모델 · 경로 · 로봇 ID를 실행 환경에 맞춥니다.**

## 01 · 기본값의 의미

| 값 | 의미 |
| --- | --- |
| `127.0.0.1` | 같은 장비에서만 통신하는 로컬 테스트 주소 |
| `/path/to/…` | 사용자가 실제 절대경로로 지정할 항목 |
| `os.path.expanduser('~/…')` | 실행 중인 사용자의 홈 디렉터리 기준 경로 |
| `*.local.yaml` | 개인 장비 설정 보관용 파일명; 별도로 로드해야 적용 |

YAML 문자열의 `~`나 `$HOME`은 자동 확장된다고 가정하지 않습니다.

## 02 · 네트워크

| 송신 기능 | 설정 파일 | 항목 |
| --- | --- | --- |
| 카메라 영상 | `robot_ws/src/network/camera_stream_sender/config/camera_stream_sender.param.yaml` | `rpi_ip` |
| LiDAR | `robot_ws/src/network/lidar_stream_sender/config/lidar_stream_sender.param.yaml` | `target_ip` |
| 위치·경로·이벤트 | `robot_ws/src/network/pose_path_event_sender/config/pose_path_event_sender.yaml` | `rpi5_ip` |
| 모의 로봇 | `d_twin/ros2/simulation/sim_executor/config/sim_executor.param.yaml` | `rpi5_ip` |

`network_bringup`의 `rpi5_ip` 인자는 **위치·경로 송신에만 전달**됩니다.
LiDAR와 카메라 주소도 각각 맞춰야 합니다.

LiDAR 런치는 설정 파일 경로를 인자로 받을 수 있습니다.

```bash
ros2 launch lidar_stream_sender lidar_stream_sender.launch.py \
  params_file:=/path/to/lidar.local.yaml
```

## 03 · 모델과 데이터

| 항목 | 설정 위치 |
| --- | --- |
| 카메라 모델 | `robot_ws/src/perception/camera_perception/config/camera_perception.param.yaml` → `engine_path` |
| 영상 수집 위치 | `robot_ws/src/experimenter/video_collector/config/video_collector.param.yaml` → `output_root` |
| 센서 수집 위치 | `sensor_experimenter.launch.py` → `output_root` 인자 |
| 모의 영상 | `sim_executor.param.yaml`의 `video_path_02`, `video_path_03` |
| 독립 모의 송신 | `d_twin/scripts/sim_executor_script.py`의 IP·영상 상수 |
| RL 정책 | `robot_ws/src/control/rl_locomotion/config/`의 모델별 YAML |

카메라 인식·영상 수집 런치는 패키지 설정 파일을 직접 읽습니다.
수정한 YAML이 실제로 로드되는지 확인하고, 필요하면 해당 노드에 `--ros-args --params-file`로 전달합니다.
TensorRT 엔진은 실행 장비의 GPU·런타임 호환성을 확인합니다.

## 04 · 하드웨어와 시뮬레이터

| 대상 | 확인 항목 |
| --- | --- |
| UART | `actuator_bridge/config/uart_bridge.param.yaml`의 장치·baudrate |
| 로봇 ID | ROS 토픽, UDP robot_id, 관제의 로봇 수 간 대응 |
| 관절 | 영점·회전 부호·각도 제한·변화량 제한 |
| STM32 | `firmware/Inc/config.h`의 `IN_HAND_MODE` 및 주기 |
| Isaac Sim | `ISAAC_SIM_ROOT` 환경변수; 기본 `$HOME/isaac-sim` |
| 메시지 바인딩 | `d_twin/scripts/robot_localization.py`의 라이브러리·Python 경로 |
| Qt 자산 | `mainwindow.cpp`, `dashboardwidgets.cpp`의 지도·STL 검색 위치 |

> 실제 주소·계정·키가 포함된 설정은 공개 저장소에 올리지 않습니다.
> 이미 추적된 파일은 `.gitignore`에 적어도 자동으로 추적 해제되지 않습니다.

---

[🏠 Wiki 홈](Home.md) · [← 🚀 설치·빌드](Setup.md) · [🎮 실행·운용 →](Operation.md)
