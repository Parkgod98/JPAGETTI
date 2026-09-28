# 🔩 STM32 펌웨어

[🐾 프로젝트 홈](../README.md) · [📖 Wiki](../docs/wiki/Home.md)

---

STM32F446RE / STM32CubeIDE 프로젝트입니다. 현재 코드는 FreeRTOS 없이 동작합니다.
`Src/main.c`가 주변장치와 BNO055를 초기화한 뒤 `control_loop_run()`을 호출합니다.
`Inc/config.h`의 제어 주기는 20 ms(50 Hz)입니다. 이전 문서의 500 Hz 구현 완료 설명은 적용되지 않습니다.

## 실제 구성

- `Src/`, `Inc/`: 관절 제어, STS3215, BNO055, UART/SPI, 상태·안전 처리.
- `Drivers/`: STM32 HAL 및 CMSIS와 해당 라이선스.
- `test_code/`: 개별 자세·보행·IMU 시험 코드. 전체가 현재 진입점은 아닙니다.
- `ST_0516.ioc`, `.project`, `.cproject`: CubeMX/CubeIDE 프로젝트 설정.

## 빌드와 장비 확인

STM32CubeIDE에서 이 디렉터리의 기존 프로젝트를 가져와 도구체인·핀 설정을 확인한 뒤 빌드합니다.
이번 정리에서는 빌드·플래시·장비 구동을 수행하지 않았습니다.
Jetson 쪽 `rl_motion_manager.launch.py`는 UART 브리지 설정을 참조합니다.
SPI 관련 코드와 시험 도구도 남아 있으므로 연결 방식은 실제 배선과 양쪽 설정을 대조해야 합니다.

`Inc/config.h`의 `IN_HAND_MODE=1`은 자세 안전 한계를 시험용으로 완화합니다.
이 값과 관절 영점·부호·한계는 이번 정리에서 변경하지 않았으며, 실제 바닥 보행 전 담당자가 확인해야 합니다.
상세 배선은 [하드웨어 설계](../hardware/docs/hardware_design.md),
기술 기록은 [아키텍처](docs/architecture.md)를 참고하세요. 과거 기록과 현재 코드가 다르면 현재 코드를 기준으로 합니다.
