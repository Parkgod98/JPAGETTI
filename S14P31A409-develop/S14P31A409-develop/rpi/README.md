# 🖥️ 관제 브리지 · Qt

[🐾 프로젝트 홈](../README.md) · [📖 Wiki](../docs/wiki/Home.md)

---

`bridge_app/`은 UDP 수신 및 POSIX 공유메모리 브리지이고, `qt_app/`은 Qt 6 관제 앱입니다.
Qt 앱은 브리지의 `shm_def.h`, `proto.h` 등을 참조합니다.

## 빌드

Linux C/C++ 도구체인, make, CMake 3.19 이상, Qt 6.5 이상이 필요합니다.
Qt 컴포넌트는 Core, Widgets, OpenGL, OpenGLWidgets입니다.

```bash
cd "$PROJECT_ROOT/rpi/bridge_app"
make
cd "$PROJECT_ROOT/rpi/qt_app"
cmake -S . -B build
cmake --build build
```

브리지 실행 파일은 Makefile로 생성합니다. 빌드 환경과 알려진 제한은
[트러블슈팅](../docs/wiki/Troubleshooting.md)을 참고하세요.

## 실행 순서

브리지와 Qt를 각각 다른 터미널에서 실행합니다.

```bash
cd "$PROJECT_ROOT/rpi/bridge_app"
./bridge_daemon 4
```

```bash
cd "$PROJECT_ROOT/rpi/qt_app"
./build/DisasterControlQt
```

숫자는 관리할 로봇 수입니다. 공유메모리 이름은 `/robot_bridge_N` 형식입니다.
송신 측 robot_id와 맞춰야 합니다.

| 포트/IPC | 용도 |
| --- | --- |
| UDP 9000 | 로봇 → 브리지 데이터 |
| UDP 9001 | 브리지 → 로봇 명령 |
| UDP 9002 | 외부 PC 연동 |
| POSIX 공유메모리 | 브리지 ↔ Qt 상태·명령 |

지도와 STL은 Qt 소스의 상대경로 후보 또는 사용자 홈 아래 `robot_project/`에서 찾습니다.
자산 배치가 현재 장비와 맞는지 확인하세요.
`docs_*` 문서는 과거 설계·학습 기록으로 예전 폴더명이나 Makefile 타깃이 나올 수 있습니다.
현재 빌드에는 이 README와 실제 Makefile을 기준으로 합니다.
