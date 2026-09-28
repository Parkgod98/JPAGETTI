# 🧠 AI 학습

[🐾 프로젝트 홈](../README.md) · [📖 Wiki](../docs/wiki/Home.md)

---

- `rl/`: Isaac Gym 기반 legged_gym/rsl_rl, 보행 실험 보고서·체크포인트·ONNX·테스트 벡터.
- `vision/`: YOLO person 탐지 데이터 정리, 학습·평가·내보내기 노트북 및 모델.

RL 실행 패키지는 `../robot_ws/src/control/rl_locomotion/`입니다.
비전 실행 패키지는 `../robot_ws/src/perception/camera_perception/`입니다.
학습 환경과 Jetson 추론 환경은 분리되어 있으며, TensorRT 엔진은 대상 장비 호환성 확인이 필요합니다.

노트북 출력은 공개 정리에서 비웠습니다. 데이터·모델 경로는 예시 상대경로이므로 실행 전 확인하세요.
일부 데이터 정리 스크립트는 입력 파일을 삭제하거나 라벨을 덮어씁니다. 데이터 복사본에서 사용하세요.
원본 데이터셋과 학습 환경 전체가 포함된 것은 아니며 재학습 성공을 이번 작업에서 검증하지 않았습니다.

모델·실험 결과는 재현 자료로 보존했습니다. 현재 `.gitattributes`만으로 모든 모델이
Git LFS 관리된다고 볼 수 없습니다. 공개 전 출처·배포 조건은 [외부 자료 문서](../docs/wiki/Third-Party.md)를 확인하세요.
