import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/core/utils/notication_config_implement.dart';
import 'package:capstone_project_travel_ease/src/presentation/loading/checklogin_controller.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NotificationConfig>(() => NotificationConfigImplement(),
        fenix: true);
    Get.put(CheckLoginController(), permanent: true);
  }
}
