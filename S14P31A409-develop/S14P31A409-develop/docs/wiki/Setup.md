# 🚀 설치·빌드

> **실행할 구성에 맞춰 환경을 준비하세요.**<br>
> ROS 2 실행 환경, Isaac Gym 학습 환경, Isaac Sim 환경은 별도로 관리합니다.

## 01 · 준비 환경

| 구성 | 환경·도구 |
| --- | --- |
| **Jetson** | Ubuntu 22.04 aarch64 · ROS 2 Humble · rosdep · colcon |
| **관제 브리지** | Linux · C 컴파일러 · make · POSIX thread / shared memory |
| **Qt 관제 앱** | C++ 컴파일러 · Qt ≥6.5 · CMake ≥3.19 |
| **STM32** | STM32CubeIDE · ST-Link · STM32F446RE |
| **RL 학습** | Isaac Gym · legged_gym · rsl_rl |
| **디지털 트윈** | Isaac Sim · 호환 ROS 메시지 바인딩 |

## 02 · 작업 경로

`robot_ws/`와 `firmware/`가 있는 소스 루트에서 실행합니다.

```bash
export PROJECT_ROOT="$PWD"
```

## 03 · Jetson ROS 2

ROS 2 Humble과 rosdep·colcon을 설치하고 rosdep을 초기화한 환경에서 진행합니다.

```bash
source /opt/ros/humble/setup.bash
cd "$PROJECT_ROOT/robot_ws"
rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install
source install/setup.bash
```

TensorRT·ONNX Runtime·카메라 및 LiDAR 외부 드라이버는 대상 장비에 맞게 준비합니다.
저장소 전체를 colcon 검색 경로로 지정하면 `lidar_collector` 중복 패키지를 찾을 수 있으므로
`robot_ws` 단위로 빌드합니다.

## 04 · 관제 브리지와 Qt

```bash
# 브리지 데몬
cd "$PROJECT_ROOT/rpi/bridge_app"
make

# Qt 대시보드
cd "$PROJECT_ROOT/rpi/qt_app"
cmake -S . -B build
cmake --build build
```

| 생성 파일 | 역할 |
| --- | --- |
| `rpi/bridge_app/bridge_daemon` | UDP·공유메모리 브리지 |
| `rpi/bridge_app/jetson_cmd_echo` | 명령 수신 시험 도구 |
| `rpi/qt_app/build/DisasterControlQt` | Qt 대시보드 |

Qt 의존 컴포넌트는 **Core · Widgets · OpenGL · OpenGLWidgets**입니다.

## 05 · STM32 펌웨어

1. STM32CubeIDE에서 `firmware/`의 기존 프로젝트를 가져옵니다.
2. `ST_0516.ioc`와 도구체인, 핀 설정을 확인합니다.
3. 관절 영점·부호·한계와 `IN_HAND_MODE`를 확인하고 빌드합니다.
4. 실제 배선을 점검한 뒤 ST-Link로 다운로드합니다.

## 06 · 디지털 트윈

ROS 패키지는 별도 워크스페이스에서 빌드합니다.

```bash
source /opt/ros/humble/setup.bash
mkdir -p "$HOME/spot-twin-ws"
cd "$HOME/spot-twin-ws"
rosdep install --from-paths "$PROJECT_ROOT/d_twin/ros2" \
  "$PROJECT_ROOT/robot_ws/src/interfaces" --ignore-src -r -y
colcon build --base-paths "$PROJECT_ROOT/d_twin/ros2" \
  "$PROJECT_ROOT/robot_ws/src/interfaces" --symlink-install
source install/setup.bash
```

기존 시뮬레이션 문서는 **Isaac Sim 5.1.0 · 내장 Python 3.11** 기준입니다.
위 ROS 빌드는 Isaac Sim용 Python 바인딩을 자동으로 준비하지 않습니다.
Script Node에서 사용하는 메시지 라이브러리의 ABI와 경로를 별도로 맞춥니다.

> **다음 단계:** [장비별 설정](Configuration.md)을 마친 뒤 [실행·운용](Operation.md)으로 진행하세요.

---

[🏠 Wiki 홈](Home.md) · [← 🏗️ 아키텍처](Architecture.md) · [⚙️ 설정 →](Configuration.md)
