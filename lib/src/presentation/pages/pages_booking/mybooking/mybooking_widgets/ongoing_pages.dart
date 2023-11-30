import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/list_hotel_mybooking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelledTab extends GetView<MyBookingController> {
  const CancelledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.checkLoginController.isLogin.value != false
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return ListHotelMyBooking(
                decoratedBox: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Cancelled & Refunded',
                      style:
                          Get.textTheme.bodySmall?.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              );
            })
        : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset(
                  fit: BoxFit.fill,
                  Assets.images.cancelled.path,
                  width: 180,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Không có đặt chỗ đã hủy',
                  style: Get.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ));
  }
}
