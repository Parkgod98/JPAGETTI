# 변경 결과

브랜치: `chore/public-release-cleanup`. GitHub 검토용 브랜치로 제출하는 변경이다. main에 병합하지 않으며 GitLab 및 GitLab Wiki 게시도 별도로 진행한다.

## 수행 내용

- 루트 및 핵심 하위 README 정리, GitLab Wiki용 소개·설치·설정·운용 문서 작성.
- 텍스트 개인 경로·실장비 IP·자체 패키지 개인 연락처 치환 및 팀원 명단 정리.
- 노트북 출력 제거, ELF 산출물 2개 제거, 재생성용 Makefile 및 Qt include 경로 정리.
- 깨진 이미지 경로 35개 수정, 누락 이미지 33개 안내, 경로 계획 문서 이미지 갱신.
- 제어 로직·모델 가중치·하드웨어 형상은 보존.

## 검증 결과

- Python 188개, JSON 98개, YAML 54개, XML 24개, 노트북 1개 정적 파싱 통과.
- 검사한 Markdown 상대링크 누락 0건, git diff --check 통과.
- 셸 실행 파일 bash -n 통과.
- 수정 후 민감정보 패턴 재검색: 텍스트 경로·사설 IP·키 시그니처 발견 0건. 별도 전체 IPv4 검색에서 현재 주소는 loopback 예시만 확인.
- 외부 바이너리 9개(모델 1개, CAD/Blender 8개)의 내장 경로는 남아 있다. final-scan.json에 위치 기록.
- 초기 커밋의 작성자/커미터 이메일 및 과거 파일 내용은 유지된다.
- ROS·Qt·STM32 빌드 및 장비 구동은 미수행. WSL에 gcc/CMake/colcon/Blender가 없다.

[남은 수동 확인](../wiki/Release-Checklist.md) · [검증 기록](validation.json) · [최종 패턴 검사](final-scan.json)

## 변경 파일 목록

`M`: 수정, `D`: 삭제, `??`: 신규. 파일 경로는 Git 저장소 루트 기준.

```text
 M .gitignore
 M README.md
 M S14P31A409-develop/S14P31A409-develop/.gitignore
 M S14P31A409-develop/S14P31A409-develop/README.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/README.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp001_spotmicro_v1_0_ik_tracking/exp001_spotmicro_v1_0_ik_tracking_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp002_spotmicro_v1_1_0_lin_vel_improve/exp002_spotmicro_v1_1_0_lin_vel_improve_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp003_spotmicro_v1_1_1_lin_vel_improve/exp003_spotmicro_v1_1_1_lin_vel_improve_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp004_spotmicro_v1_1_2_orientation_improve/exp004_spotmicro_v1_1_2_orientation_improve_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp005_spotmicro_v1_1_3_vel_improve/exp005_spotmicro_v1_1_3_vel_improve_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp006_spotmicro_v1_1_4_sigma_desc/exp006_spotmicro_v1_1_4_sigma_desc_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp007_spotmicro_v2_0_DR_friction/exp007_spotmicro_v2_0_DR_friction_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp059_spotmicro_v5_6_recovery_assist/exp059_spotmicro_v5_6_recovery_assist_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp060_spotmicro_v5_6_1_recovery_assist_push/exp060_spotmicro_v5_6_1_recovery_assist_push_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp061_spotmicro_v6_0_shared_ik_retrain/exp061_spotmicro_v6_0_shared_ik_retrain_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp062_spotmicro_v6_0_1_shared_ik_cmd_deadband/exp062_spotmicro_v6_0_1_shared_ik_cmd_deadband_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp063_spotmicro_v6_0_2_forward_tracking/exp063_spotmicro_v6_0_2_forward_tracking_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp064_spotmicro_v6_0_3_low_speed_clearance/exp064_spotmicro_v6_0_3_low_speed_clearance_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp065_spotmicro_v6_0_4_reward_retune/exp065_spotmicro_v6_0_4_reward_retune_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp066_spotmicro_v6_1_recovery_resume/exp066_spotmicro_v6_1_recovery_resume_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp067_spotmicro_v6_1_1_contact_termination/exp067_spotmicro_v6_1_1_contact_termination_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp068_spotmicro_v6_1_2_transition_recovery/exp068_spotmicro_v6_1_2_transition_recovery_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp069_spotmicro_v6_1_3_stronger_transition_push/exp069_spotmicro_v6_1_3_stronger_transition_push_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp070_spotmicro_v6_1_4_moderate_shove_recovery/exp070_spotmicro_v6_1_4_moderate_shove_recovery_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp071_spotmicro_v6_1_5_slippery_rear_com_motor_dr/exp071_spotmicro_v6_1_5_slippery_rear_com_motor_dr_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp073_spotmicro_v6_2_prefall_tilt_recovery/exp073_spotmicro_v6_2_prefall_tilt_recovery_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp074_spotmicro_v6_2_1_prefall_tilt_recovery_25deg/exp074_spotmicro_v6_2_1_prefall_tilt_recovery_25deg_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp075_spotmicro_v6_2_2_prefall_tilt_recovery_25deg_continue/exp075_spotmicro_v6_2_2_prefall_tilt_recovery_25deg_continue_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp076_spotmicro_v6_2_3_prefall_tilt_recovery_30deg/exp076_spotmicro_v6_2_3_prefall_tilt_recovery_30deg_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp077_spotmicro_v6_2_4_prefall_tilt_recovery_30deg_continue/exp077_spotmicro_v6_2_4_prefall_tilt_recovery_30deg_continue_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp078_spotmicro_v6_2_5_prefall_tilt_recovery_30deg_authority/exp078_spotmicro_v6_2_5_prefall_tilt_recovery_30deg_authority_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp079_spotmicro_v6_2_6_prefall_tilt_recovery_30deg_rollback/exp079_spotmicro_v6_2_6_prefall_tilt_recovery_30deg_rollback_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp080_spotmicro_v6_3_prefall_transition_tilt_sampler/exp080_spotmicro_v6_3_prefall_transition_tilt_sampler_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp081_spotmicro_v6_3_1_prefall_transition_tilt_sampler_soft/exp081_spotmicro_v6_3_1_prefall_transition_tilt_sampler_soft_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp082_spotmicro_v6_3_2_prefall_transition_tilt_sampler_focused/exp082_spotmicro_v6_3_2_prefall_transition_tilt_sampler_focused_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp083_spotmicro_v6_3_3_prefall_transition_tilt_sampler_stable/exp083_spotmicro_v6_3_3_prefall_transition_tilt_sampler_stable_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp084_spotmicro_v6_4_prefall_brace_mode/exp084_spotmicro_v6_4_prefall_brace_mode_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp085_spotmicro_v7_0_slope_terrain_curriculum/exp085_spotmicro_v7_0_slope_terrain_curriculum_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp086_spotmicro_v7_0_slope_terrain_curriculum/exp086_spotmicro_v7_0_slope_terrain_curriculum_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp087_spotmicro_v7_0_1_slope_terrain_continue/exp087_spotmicro_v7_0_1_slope_terrain_continue_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp088_spotmicro_v7_1_slope_terrain_gentle_restart/exp088_spotmicro_v7_1_slope_terrain_gentle_restart_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp089_spotmicro_v7_1_slope_terrain_gentle_restart/exp089_spotmicro_v7_1_slope_terrain_gentle_restart_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp090_spotmicro_v7_1_1_slope_terrain_walk_refine/exp090_spotmicro_v7_1_1_slope_terrain_walk_refine_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp091_spotmicro_v7_1_2_slope_terrain_walk_margin/exp091_spotmicro_v7_1_2_slope_terrain_walk_margin_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/experiments/exp092_spotmicro_v7_1_3_slope_terrain_survival_margin/exp092_spotmicro_v7_1_3_slope_terrain_survival_margin_report.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/exports/spotmicro_v6_1_3_model_4100_vectors/metadata.json
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/exports/spotmicro_v6_1_5_model/metadata.json
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/exports/spotmicro_v6_3_1_model_vectors/metadata.json
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/exports/spotmicro_v7_1_model_vectors/metadata.json
 M S14P31A409-develop/S14P31A409-develop/ai_training/rl/test_vectors/v5_4_4/metadata.json
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/01_delete_orphan.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/02_make_all_0_person.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/03_01_draw_segment.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/03_draw_bbox.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/04_delete_unfit.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/05_coco_to_yolov11.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/06_segmentation_to_bbox.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/07_crawl_from_coco.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/08_filt_coco.py
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/dataset_pipeline/README.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/training/README.md
 M S14P31A409-develop/S14P31A409-develop/ai_training/vision/training/person_detection_yolo11.ipynb
 M S14P31A409-develop/S14P31A409-develop/d_twin/README.md
 M S14P31A409-develop/S14P31A409-develop/d_twin/isaac_projects/launch_isaac.sh
 M S14P31A409-develop/S14P31A409-develop/d_twin/ros2/planning/global_path_manager/README.md
 M S14P31A409-develop/S14P31A409-develop/d_twin/ros2/planning/global_path_manager/package.xml
 M S14P31A409-develop/S14P31A409-develop/d_twin/ros2/planning/sar_planner/package.xml
 M S14P31A409-develop/S14P31A409-develop/d_twin/ros2/simulation/sim_executor/config/sim_executor.param.yaml
 M S14P31A409-develop/S14P31A409-develop/d_twin/ros2/simulation/sim_executor/package.xml
 M S14P31A409-develop/S14P31A409-develop/d_twin/scripts/robot_localization.py
 M S14P31A409-develop/S14P31A409-develop/d_twin/scripts/sim_executor_script.py
 M S14P31A409-develop/S14P31A409-develop/docs/README.md
 M S14P31A409-develop/S14P31A409-develop/experimenter/lidar_collector/lidar_collector/pointcloud2_jsonl_recorder.py
 M S14P31A409-develop/S14P31A409-develop/experimenter/lidar_collector/package.xml
 M S14P31A409-develop/S14P31A409-develop/experimenter/lidar_collector/setup.py
 M S14P31A409-develop/S14P31A409-develop/firmware/README.md
 M S14P31A409-develop/S14P31A409-develop/firmware/bno055_i2c_busy_recovery_report.md
 M S14P31A409-develop/S14P31A409-develop/hardware/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/bringup/robot_bringup/launch/sensor_experimenter.launch.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/bringup/robot_bringup/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/actuator_bridge/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/classic_control/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/classic_control/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/locomotion_common/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/locomotion_common/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/motion_manager/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/rl_locomotion/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/rl_locomotion/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/control/rl_locomotion/test_vectors/exp043/metadata.json
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/lidar_collector/lidar_collector/pointcloud2_jsonl_recorder.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/lidar_collector/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/lidar_collector/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/video_collector/config/video_collector.param.yaml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/video_collector/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/video_collector/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/experimenter/video_collector/video_collector/video_collector_node.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/interfaces/robot_interfaces/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/localization/spot_localization/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/navigation/spot_navigation/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/camera_stream_sender/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/camera_stream_sender/config/camera_stream_sender.param.yaml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/camera_stream_sender/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/lidar_sparse/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/lidar_stream_sender/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/lidar_stream_sender/config/lidar_stream_sender.param.yaml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/lidar_stream_sender/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/lidar_stream_sender/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/network_bringup/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/network_bringup/launch/network_bringup.launch.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/network_bringup/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/pose_path_event_sender/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/pose_path_event_sender/config/pose_path_event_sender.yaml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/pose_path_event_sender/launch/pose_path_event_sender.launch.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/pose_path_event_sender/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/network/pose_path_event_sender/src/pose_path_event_sender_node.cpp
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/perception/camera_perception/README.md
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/perception/camera_perception/camera_perception/camera_perception_node.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/perception/camera_perception/config/camera_perception.param.yaml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/perception/camera_perception/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/perception/camera_perception/setup.py
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/perception/lidar_perception/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/vendor/oak_camera_driver/config/oak_camera_driver.param.yaml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/vendor/oak_camera_driver/package.xml
 M S14P31A409-develop/S14P31A409-develop/robot_ws/src/vendor/oak_camera_driver/setup.py
 M S14P31A409-develop/S14P31A409-develop/rpi/README.md
 D S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/bridge_daemon
 M S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/docs_architecture/bridge_qt_full_flow.md
 M S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/docs_architecture/qt_bridgeclient_encapsulation_plan.md
 M S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/docs_source_walkthrough/0428_bride_app_codex_line_by_line_report.md
 M S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/docs_source_walkthrough/indexed_source_flow_report.md
 D S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/jetson_cmd_echo
 M S14P31A409-develop/S14P31A409-develop/rpi/qt_app/CMakeLists.txt
 M S14P31A409-develop/S14P31A409-develop/rpi/qt_app/src/dashboardwidgets.cpp
 M S14P31A409-develop/S14P31A409-develop/rpi/qt_app/src/mainwindow.cpp
 M S14P31A409-develop/S14P31A409-develop/shared/README.md
 M S14P31A409-develop/S14P31A409-develop/tools/README.md
?? S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/.gitignore
?? S14P31A409-develop/S14P31A409-develop/rpi/bridge_app/Makefile
?? docs/audit/CHANGES.md
?? docs/audit/README.md
?? docs/audit/baseline.json
?? docs/audit/final-scan.json
?? docs/audit/validation.json
?? docs/wiki/Architecture.md
?? docs/wiki/Configuration.md
?? docs/wiki/Home.md
?? docs/wiki/Release-Checklist.md
?? docs/wiki/Setup.md
?? docs/wiki/Third-Party.md
```
