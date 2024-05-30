import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetBookingInfo extends GetView<ListRoomController> {
  const WidgetBookingInfo({Key? key, required this.roomQuantity})
      : super(key: key);
  final int roomQuantity;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                controller.argListRoom.dateTimeRange?.end.formatDateToString(),
            style: Get.textTheme.bodySmall
                ?.copyWith(color: Colors.black, fontSize: 13),
          ),
          TextSpan(
            text: ' - ',
            style: Get.textTheme.bodySmall?.copyWith(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: controller.argListRoom.dateTimeRange?.start
                .formatDateToString(),
            style: Get.textTheme.bodySmall
                ?.copyWith(color: Colors.black, fontSize: 13),
          ),
          TextSpan(
            text:
                ', ${((controller.argListRoom.dateTimeRange?.end.day)! - (controller.argListRoom.dateTimeRange?.start.day)!).toInt()} Night(s)',
            style: Get.textTheme.bodySmall
                ?.copyWith(color: Colors.black, fontSize: 13),
          ),
          TextSpan(
            text: ', ${roomQuantity.toInt()} Room(s)',
            style: Get.textTheme.bodySmall
                ?.copyWith(color: Colors.black, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
