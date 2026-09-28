# 🐾 SPOT_GET_IT Wiki

> **로봇을 이해하고, 환경을 준비하고, 직접 실행하기 위한 가이드**<br>
> Jetson · STM32 · 관제 · 시뮬레이션을 구성별로 살펴봅니다.

---

## 🗺️ 처음 시작한다면

**[① 시스템 이해](Architecture.md)** → **[② 환경 준비](Setup.md)** → **[③ 장비 설정](Configuration.md)** → **[④ 실행](Operation.md)**

| 문서 | 이럴 때 읽으세요 |
| --- | --- |
| **🏗️ [시스템 아키텍처](Architecture.md)** | 각 장치의 역할과 데이터 흐름을 파악하고 싶을 때 |
| **🚀 [설치·빌드](Setup.md)** | Jetson, 관제 앱, STM32 개발 환경을 준비할 때 |
| **⚙️ [장비별 설정](Configuration.md)** | IP, 모델 파일, UART 장치, 데이터 경로를 바꿀 때 |
| **🎮 [실행·운용](Operation.md)** | 로봇 노드·관제·시뮬레이션을 실행할 때 |
| **🔧 [트러블슈팅](Troubleshooting.md)** | 빌드·통신·모델·런치 문제를 확인할 때 |
| **📄 [외부 자료·라이선스](Third-Party.md)** | 코드·모델·CAD의 출처와 고지 위치를 찾을 때 |

---

## 🧩 구성 한눈에 보기

| 장치·환경 | 주요 역할 | 코드 위치 |
| --- | --- | --- |
| **Jetson Orin Nano** | 인식·측위·경로 추종·보행 추론 | `robot_ws/` |
| **STM32F446RE** | 관절 제어·서보·IMU·UART | `firmware/` |
| **Raspberry Pi / Qt** | 데이터 중계·다중 로봇 관제 | `rpi/` |
| **Isaac Sim** | 디지털 트윈·모의 로봇 | `d_twin/` |
| **학습 환경** | RL 보행·YOLO 인명 탐지 | `ai_training/` |

> 모든 경로는 `robot_ws/`, `firmware/`가 위치한 **소스 루트** 기준입니다.
> 명령의 `PROJECT_ROOT`는 이 디렉터리를 가리킵니다.

---

[🏠 Wiki 홈](Home.md) · [🏗️ 아키텍처 →](Architecture.md)
