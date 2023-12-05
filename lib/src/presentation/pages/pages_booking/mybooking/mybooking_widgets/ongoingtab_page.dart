import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/list_hotel_mybooking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OngoingTab extends GetView<MyBookingController> {
  const OngoingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.checkLoginController.isLogin.value != false
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListHotelMyBooking(
                  decoratedBox: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 12),
                      child: Text(
                        'Paid',
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
                  Expanded(
                    child: Image.asset(
                      fit: BoxFit.contain,
                      Assets.images.ongoing.path,
                      // width: Get.width * 0.5,
                      // height: Get.height * 0.25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Không có Đặt Chỗ',
                    style: Get.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}
