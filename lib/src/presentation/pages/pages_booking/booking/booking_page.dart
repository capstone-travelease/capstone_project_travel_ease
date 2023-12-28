import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/room_detail/room_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:timeline_tile/timeline_tile.dart';

class BookingPage extends GetView<BookingController> {
  static const String routeName = '/BookingPage';
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarBooking(),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: controller.pages),
      bottomNavigationBar: Obx(
        () => Footer(
          onTap: () {
            controller.nextToStepAndPage();
          },
          text: Text(
            (controller.currentStepAndPage == controller.pages.length - 1)
                ? 'Confirm Booking'
                : 'Next Step',
            style: Get.textTheme.bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class AppbarBooking extends GetView<BookingController>
    implements PreferredSizeWidget {
  const AppbarBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Obx(
                    () {
                      if (controller.currentStepAndPage ==
                          controller.pages.length - 1) {
                        return Text(
                          'Finish booking',
                          style: Get.textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                        );
                      }
                      return Text(
                        (controller.currentStepAndPage ==
                                controller.pages.length - 2)
                            ? 'Booking overview'
                            : 'Fill in your details',
                        style: Get.textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.06,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.pages.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => TimelineTile(
                          axis: TimelineAxis.horizontal,
                          isFirst: index == 0,
                          isLast: index == controller.pages.length - 1,
                          beforeLineStyle: LineStyle(
                              color: controller.currentStepAndPage >= index
                                  ? Colors.white
                                  : Colors.grey[300]!),
                          indicatorStyle: IndicatorStyle(
                              width: 20,
                              color: controller.currentStepAndPage >= index
                                  ? Colors.white
                                  : Colors.grey[300]!,
                              iconStyle: IconStyle(
                                  iconData:
                                      controller.currentStepAndPage >= index
                                          ? Icons.done
                                          : Icons.circle,
                                  fontSize: 14,
                                  color: controller.currentStepAndPage == index
                                      ? Colors.redAccent
                                      : Colors.redAccent)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class Footer extends GetView<BookingController> {
  final VoidCallback onTap;
  final Text text;
  const Footer({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Total Price \n',
                        style: Get.textTheme.bodySmall!),
                    TextSpan(
                      text: controller.room.value?.roomPrice != null
                          ? NumberFormat.currency(
                                  locale: 'vi_VN', symbol: 'VND')
                              .format(controller.room.value?.roomPrice)
                          : '',
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: '\nIncludes taxes',
                        style: Get.textTheme.bodySmall!),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: onTap,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 22),
                  child: text,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
