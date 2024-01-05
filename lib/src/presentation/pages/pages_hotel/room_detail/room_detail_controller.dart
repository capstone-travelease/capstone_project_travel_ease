import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  final activeIndex = 0.obs;
  late int roomId;
  String fullText =
      'Khách sạn 5 sao là điểm đến hoàn hảo cho những người yêu thích sự sang trọng và dịch vụ tối ưu. Nơi đây đượng thiết kế với đẳng cấp và vẻ đẹp tối tân, từ kiến trúc đến nội thất. Khách sạn này cung cấp các dịch vụ cao cấp như nhà hàng 5 sao, spa, phòng tập thể dục, hồ bơi và quầy bar tại tầng thượng với tầm nhìn ấn tượng. Đội ngũ nhân viên luôn sẵn sàng phục vụ mọi nhu cầu của khách hàng, từ đón tiếp đến dịch vụ phòng hàng ngày. Tại đây, bạn sẽ tận hưởng kỳ nghỉ đáng nhớ trong không gian tuyệt vời và tiện nghi đỉnh cao.';
  final isExpanded = false.obs;

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
