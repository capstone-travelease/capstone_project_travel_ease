import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/list_hotel_mybooking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedTab extends GetView<MyBookingController> {
  const CompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.checkLoginController.isLogin.value != false
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return ListHotelMyBooking(
                decoratedBox: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(22)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Completed',
                      style: Get.textTheme.bodySmall
                          ?.copyWith(color: Colors.green),
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
                  Assets.images.completed.path,
                  width: 180,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Không có đặt chỗ đã qua',
                  style: Get.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ));
  }
}
