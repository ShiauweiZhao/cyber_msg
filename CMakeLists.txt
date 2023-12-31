cmake_minimum_required(VERSION 3.5)

set(PROJECT_NAME cyber_msgs)
project(${PROJECT_NAME} VERSION 1.0.0)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()


set(PROJECT_DEPENDENCIES
  std_msgs
  geometry_msgs
  geographic_msgs
  nav_msgs
)

foreach(DEPENDENCY ${PROJECT_DEPENDENCIES})
  find_package(${DEPENDENCY} REQUIRED)
endforeach()

set(MSGS_FILES
  "msg/ControllerInfo.msg"
  "msg/ControlMode.msg"
  "msg/FollowTargetInfo.msg"
  "msg/PlatformInfo.msg"
  "msg/PlatformStateMachineEvent.msg"
  "msg/PlatformStatus.msg"
  "msg/PoseStampedWithID.msg"
  "msg/PoseWithID.msg"
  "msg/Speed.msg"
  "msg/Thrust.msg"
  "msg/TrajectoryPoint.msg"
  "msg/MissionEvent.msg"
  "msg/MissionUpdate.msg"
  "msg/NodeStatus.msg"
  "msg/TrajGenInfo.msg"
  "msg/Geofence.msg"
  "msg/AlertEvent.msg"
  "msg/BehaviorStatus.msg"
  "msg/YawMode.msg"
)

set(SRVS_FILES
  "srv/DynamicFollower.srv"
  "srv/DynamicLand.srv"
  "srv/GeopathToPath.srv"
  "srv/GetOrigin.srv"
  "srv/ListControlModes.srv"
  "srv/PackagePickUp.srv"
  "srv/PackageUnPick.srv"
  "srv/PathToGeopath.srv"
  "srv/SetControlMode.srv"
  "srv/SetOrigin.srv"
  "srv/SetPlatformStateMachineEvent.srv"
  "srv/SetSpeed.srv"
  "srv/SetGeofence.srv"
  "srv/GetGeofence.srv"
)

set(ACTION_FILES
  "action/DetectArucoMarkers.action"
  "action/FollowPath.action"
  "action/GoToWaypoint.action"
  "action/Land.action"
  "action/TakeOff.action"
  "action/GeneratePolynomialTrajectory.action"
  "action/SetArmingState.action"
  "action/SetOffboardMode.action"
  "action/FollowReference.action"
)
add_action_files(
  DIRECTORY action
  FILES ${ACTION_FILES}
)

add_message_files(
  DIRECTORY msg
  FILES ${MSGS_FILES}
)
add_service_files(
  DIRECTORY srv
  FILES ${SRVS_FILES}
)

generate_messages(
    DEPENDENCIES actionlib_msgs std_msgs geometry_msgs nav_msgs
)

catkin_package(
    CATKIN_DEPENDS actionlib_msgs geometry_msgs
)

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)
install(DIRECTORY include/${PROJECT_NAME}/
    DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)
