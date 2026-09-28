# 🔧 트러블슈팅

> **설정 → 실행 환경 → 데이터 흐름 순서로 확인합니다.**

## 빠른 확인표

| 증상 | 먼저 확인할 내용 |
| --- | --- |
| ROS 패키지를 찾지 못함 | Humble 및 해당 워크스페이스 `install/setup.bash` 적용 여부 |
| colcon 중복 패키지 오류 | 저장소 전체 대신 `robot_ws`에서 빌드했는지 |
| Qt 빌드 실패 | Qt 6.5 이상, OpenGL 관련 컴포넌트, `bridge_app` 헤더 경로 |
| 대시보드가 로봇을 표시하지 않음 | 브리지 실행 여부, 공유메모리, robot_id 및 로봇 수 |
| 영상·LiDAR가 오지 않음 | 각 송신기의 IP 설정, UDP 수신, 센서 토픽 발행 여부 |
| 위치만 오고 LiDAR는 안 옴 | `network_bringup` IP 인자가 LiDAR에 전달되지 않는 점 |
| 모델 로딩 실패 | 파일 경로, ONNX/TensorRT 형식, 장비 런타임 호환성 |
| UART 피드백 없음 | 장치 파일·권한·배선·baudrate·프레임 정의 |
| Isaac Sim 메시지 import 실패 | 내장 Python ABI와 ROS 메시지 바인딩 경로 |

## 구현 범위와 알려진 제한

### 실행 파일과 런치

`control_core.launch.py`, `hardware_stand.launch.py`, `hardware_rl_low_speed.launch.py`는 현재 빈 파일입니다.
`rl_motion_manager.launch.py` 등 실제 구성된 진입점을 사용합니다.
하나의 런치로 모든 센서·측위·통신·보행 구성이 자동 준비되지는 않습니다.

### 인명 탐지 상태

카메라 노드는 연속 탐지 시 person_detected와 DETECT 모드를 발행합니다.
현재 미탐지 후 False로 되돌리는 코드는 주석 처리돼 있으므로 자동 탐지 해제를 전제로 사용하지 않습니다.

### 펌웨어 시험 설정

`firmware/Inc/config.h`의 `IN_HAND_MODE=1`은 자세 한계를 시험용으로 완화합니다.
관절 영점·부호·제한값과 함께 실제 운용 조건에 맞는지 확인해야 합니다.

### 시뮬레이션·학습 환경

`robot_ws_311`은 저장소에 포함되지 않습니다. Isaac Sim용 바인딩은 별도로 준비해야 합니다.
Isaac Gym RL 학습과 Isaac Sim 디지털 트윈은 서로 다른 환경입니다.
모델·CAD·실험 자료 전체가 Git LFS로 관리되는 상태는 아닙니다.

## 검증 범위

소스·설정 문법, 문서 상대링크 및 공개 설정의 정적 검사를 수행했습니다.
ROS·Qt·STM32 전체 빌드, 실물 구동, 시뮬레이션 통합 테스트는 대상 장비에서 별도로 확인해야 합니다.

---

[🏠 Wiki 홈](Home.md) · [← 🎮 실행·운용](Operation.md) · [📄 외부 자료 →](Third-Party.md)
