import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  final activeIndex = 0.obs;
  late int roomId;
  final isExpanded = false.obs;
  final ListRoomController listRoomController = Get.find();
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final Rxn<RoomModel> room = Rxn<RoomModel>();
  @override
  void onInit() {
    roomId = Get.arguments['roomId'];
    fetchRoomDetail();
    super.onInit();
  }

  Future<void> fetchRoomDetail() async {
    try {
      final res = await _bookingService.detailRoom(roomId: roomId);
      room.call(res);
    } catch (e) {
      Get.log(
        e.toString(),
      );
    }
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
