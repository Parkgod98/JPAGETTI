# 제출 전 확인

## 이번 정리

- README 및 Wiki를 실제 파일 구조 기준으로 작성했다.
- 개인 홈·Windows 경로, 장비 IP, 자체 패키지 연락처, README 팀원 목록을 정리했다.
- 노트북 저장 출력을 비웠다.
- 관제 ELF 실행 파일 2개를 제거하고 Makefile 및 Qt 헤더 경로를 정리했다.
- 기존 제어 알고리즘·안전 임계값·학습 가중치·CAD 형상은 변경하지 않았다.

## 남은 확인

1. **Git 이력:** 로컬에 보이는 초기 커밋 1개에는 과거 값이 남아 있다. 원래 GitLab 개발 이력,
   다른 브랜치·태그·Wiki·첨부파일·CI 변수는 이번 저장소 검사 범위 밖이다.
   과거 값까지 없애야 한다면 담당자와 공개용 이력 정책을 정한 후 별도 정리한다.
   실제 키가 뒤늦게 발견되면 폐기·재발급도 필요하다.
2. **바이너리 내장 경로:** `legged_gym/resources/actuator_nets/anydrive_v3_lstm.pt`의 디버그 메타데이터,
   `resources/robots/spot_micro/Parts/`와 `spotmicro_test/Parts/`의 `spotmicroai.blend`,
   `SpotMicroAI_AdditionalParts.FCStd`, `SpotMicroAI_JetsonParts.FCStd`, `SpotMicroAI_JetsonParts.FCStd1`에
   원 제작 환경 경로가 남아 있다. 바이너리 바이트를 임의 치환하지 않았다.
   원 도구에서 메타데이터/외부 참조를 정제해 재저장하거나, 참조 여부 확인 후 공개 대상에서 제외한다.
3. **권리·개인정보:** 모델·데이터셋·CAD 출처 및 재배포 조건, 사진·영상·도면 속 정보,
   라이선스 고지의 작성자 표기와 Git 커밋 작성자 공개 범위를 확인한다.
4. **대용량 자료:** 약 815 MiB의 스냅샷과 대형 CAD·모델을 GitLab 제한에 맞게 유지할지 결정한다.
   용량을 줄이려면 현재 파일 삭제만으로 기존 Git 객체가 줄어들지는 않는다.
5. **실행 검증:** ROS·Qt·STM32 빌드와 실제 센서/통신/로봇 동작을 대상 장비에서 확인한다.
   설정 placeholder, 외부 드라이버, 모델 호환성, 비어 있는 런치 파일을 확인한다.
   `firmware/Inc/config.h`의 `IN_HAND_MODE=1`은 시험 설정이다.
6. **게시:** Wiki 파일을 GitLab Wiki에 옮기고 링크를 확인한다. GitHub 검토용 브랜치와 별개로 GitLab 게시 및 main 병합은 따로 진행한다.

현재 결과는 공개 준비 변경안입니다. 바이너리 정보와 과거 이력까지 완전 제거됐다고 보고하지 않습니다.
