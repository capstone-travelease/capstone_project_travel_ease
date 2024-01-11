import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:get/get.dart';

class BottomSheetRoomAdultController extends GetxController {
  // var numberRoom = RxInt(0);
  final NotificationConfig tinTucConfig = Get.find();
  final RxInt numberRoom = 1.obs;
  final RxInt numberAdult = 1.obs;
  void incrementRoom() {
    if (numberRoom.value < 10) {
      numberRoom.value++;
    }
  }

  void decrementRoom() {
    if (numberRoom.value > 1) {
      numberRoom.value--;
    } // Giảm giá trị
  }

  void incrementAdult() {
    if (numberAdult.value < 10) {
      numberAdult.value++;
    }
  }

  void decrementAdult() {
    if (numberAdult.value > 1) {
      numberAdult.value--;
    } // Giảm giá trị
  }
}
