import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_widgets/cancelled_pages.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_widgets/completed_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_widgets/ongoingtab_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingPage extends GetView<MyBookingController> {
  static const String routeName = '/MyBookingPage';
  const MyBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: const AppBarMyBooking(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children: const [
                  OngoingTab(),
                  CompletedTab(),
                  CancelledTab(),
                ],
              ),
            ),
          ),
          Obx(() => controller.checkLoginController.isLogin.value == false
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            'Đăng kí thành viên, hưởng nhiều ưu đãi!',
                            style: Get.textTheme.bodyMedium!.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: () => controller.pushLogin(),
                            child: SizedBox(
                              width: Get.width,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Đăng Nhập/Đăng Kí',
                                      style: Get.textTheme.bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}

class AppBarMyBooking extends GetView<MyBookingController>
    implements PreferredSizeWidget {
  const AppBarMyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'My Booking',
              style: Get.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.tabs.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.tabs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => InkWell(
                        onTap: () => controller.onTabChanged(item),
                        child: Center(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: controller.selected.value == item
                                    ? Colors.redAccent
                                    : null,
                                border: controller.selected.value != item
                                    ? Border.all(color: Colors.grey[500]!)
                                    : null,
                                borderRadius: BorderRadius.circular(22)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 6),
                              child: Text(
                                item.type.title,
                                style: Get.textTheme.titleSmall!.copyWith(
                                    color: controller.selected.value == item
                                        ? Colors.white
                                        : Colors.grey[500]),
                              ),
                            ),
                          ),
                        ),
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(120);
}
