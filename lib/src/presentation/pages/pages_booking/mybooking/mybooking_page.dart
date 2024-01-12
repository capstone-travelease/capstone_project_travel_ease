import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_widgets/Mybookingtab_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingPage extends GetView<MyBookingController> {
  static const String routeName = '/MyBookingPage';
  const MyBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: Get.theme.colorScheme.background,
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'My Booking',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            surfaceTintColor: Get.theme.colorScheme.background,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Get.theme.colorScheme.background,
            floating: true,
            snap: true,
            pinned: true,
            flexibleSpace: const TabView(),
          )
        ],
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: MyBookingTab(),
              ),
            ),
            Obx(
              () => controller.checkLoginController.isLogin.value == false
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                onTap: () =>
                                    controller.checkLoginController.pushLogin(),
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
                                              .copyWith(
                                            color: Colors.white,
                                          ),
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
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}

class TabView extends GetView<MyBookingController> {
  const TabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.tabs.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.tabs[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => InkWell(
                onTap: () => controller.onTabChanged(item),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: controller.selected.value == item
                        ? Colors.redAccent
                        : null,
                    border: controller.selected.value != item
                        ? Border.all(color: Colors.grey[500]!)
                        : null,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      // vertical: 6,
                    ),
                    child: Center(
                      child: Text(
                        item.type.title,
                        style: Get.textTheme.titleSmall!.copyWith(
                          color: controller.selected.value == item
                              ? Colors.white
                              : Colors.grey[500],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 14,
          );
        },
      ),
    );
  }
}
