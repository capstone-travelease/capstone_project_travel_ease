import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:get/get.dart';

class BottomSheetRoomAdultController extends GetxController {
  // var numberRoom = RxInt(0);
  final NotificationConfig tinTucConfig = Get.find();
  final RxInt numberRoom = 0.obs;
  final RxInt numberAdult = 0.obs;
  void incrementRoom() {
    numberRoom.value++; // Tăng giá trị
  }

  void decrementRoom() {
    if (numberRoom.value > 0) {
      numberRoom.value--;
    } // Giảm giá trị
  }

  void incrementAdult() {
    numberAdult.value++; // Tăng giá trị
  }

  void decrementAdult() {
    if (numberAdult.value > 0) {
      numberAdult.value--;
    } // Giảm giá trị
  }
}
