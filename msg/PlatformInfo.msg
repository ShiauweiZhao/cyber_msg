# Message that shows the platform status and the current control mode

std_msgs/Header header                      # Message header

bool connected                              # Whether the platform is connected or not
bool armed                                  # Whether the platform is armed or not
bool offboard                               # Whether the offboard mode is set or not

cyber_msgs/PlatformStatus status              # Platform status
cyber_msgs/ControlMode current_control_mode   # Platform control mode
