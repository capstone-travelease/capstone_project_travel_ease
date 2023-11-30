import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/modules/other_modules/other_modules.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/core/utils/notication_config_implement.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/repositories/user_repository.dart';
import 'package:capstone_project_travel_ease/src/infrastructure/user_client/user_client.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    final otherModules = OtherModules();
    // TODO: implement dependencies

    Get.put<Dio>(otherModules.initDio(), permanent: true, tag: Constant.dioTAG);
    Get.put<UserClient>(
      UserClient(
        Get.find<Dio>(tag: Constant.dioTAG),
        baseUrl: 'http://35.187.252.114:3634',
      ),
      permanent: true,
      tag: Constant.userClientTAG,
    );
    Get.put<UserService>(
      UserRepository(),
      permanent: true,
      tag: Constant.uerSerServiceTAG,
    );
    Get.lazyPut<NotificationConfig>(() => NotificationConfigImplement(),
        fenix: true);
    Get.put(CheckLoginController(), permanent: true);
  }
}
