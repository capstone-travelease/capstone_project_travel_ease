import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/notification/notification_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/list_hotel.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/search_hotel_widget/widget_search_hotel_.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const AppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey[300]!),
                      color: Colors.white),
                  child: WidgetSearchHotelPage(
                    title: 'Search Your Hotel',
                    onChange: (SearchModel data) async {
                      await Get.toNamed(
                        SearchHotelPage.routeName,
                        preventDuplicates: false,
                        arguments: ArgSearchHotel(
                            dateTimeRange: DateTimeRange(
                                end: data.todDay!, start: data.fromDay!),
                            location: data.location ?? '',
                            numberRoom: data.numberRoom ?? 0,
                            numberAdult: data.numberAdult ?? 0),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Hotel',
                      style: Get.textTheme.titleMedium!.copyWith(),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: Get.textTheme.bodySmall!
                            .copyWith(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: Obx(
                  () => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listImage.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 160,
                        height: 200,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned.fill(
                              child: ExtendedImage.network(
                                controller.listImage[index],
                                fit: BoxFit.cover,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                shape: BoxShape.rectangle,
                                loadStateChanged: (ExtendedImageState state) {
                                  switch (state.extendedImageLoadState) {
                                    case LoadState.loading:
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    case LoadState.completed:
                                      return null;
                                    case LoadState.failed:
                                      return Image.asset(
                                        Assets.images.noImage.path,
                                      );
                                  }
                                },
                              ),
                            ),
                            Positioned.fill(
                                child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            )),
                            Positioned(
                              right: 8,
                              top: 10,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.redAccent),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 4),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '5.0',
                                        style: Get.textTheme.bodySmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              left: 8,
                              right: 0,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Intercontinental Hotel',
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Hồ Chí Minh',
                                            style: Get.textTheme.bodySmall!
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "400,600,000đ \n/per night",
                                        style:
                                            Get.textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Booked',
                      style: Get.textTheme.titleMedium!.copyWith(),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'See All',
                        style: Get.textTheme.bodySmall!
                            .copyWith(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                ),
              ),
              const RecentlyBooked(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends GetView<HomeController> {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(() => controller.checkLoginController.isLogin.value != false
                  ? SizedBox(
                      width: Get.width * 0.12,
                      height: Get.width * 0.12,
                      child: ClipOval(
                        child: ExtendedImage.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvNVVeso-U6DZ5v4Py3n5hYAttB7PVgb_6rA&usqp=CAU',
                          // fit: BoxFit.cover,
                          // shape: BoxShape.rectangle,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case LoadState.completed:
                                return state.completedWidget;
                              case LoadState.failed:
                                return Image.asset(
                                  Assets.images.noImageUser.path,
                                );
                            }
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () =>
                    controller.checkLoginController.isLogin.value == false
                        ? controller.pushLogin()
                        : {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        controller.checkLoginController.isLogin.value != false
                            ? 'Hello'
                            : 'Sign in / Sign Up now',
                        style: Get.textTheme.titleMedium?.copyWith(
                            color:
                                controller.checkLoginController.isLogin.value !=
                                        false
                                    ? Colors.grey
                                    : null),
                      ),
                    ),
                    Obx(
                      () => Text(
                        'to receive more coupon',
                        style: Get.textTheme.titleSmall?.copyWith(
                            color:
                                controller.checkLoginController.isLogin.value !=
                                        false
                                    ? null
                                    : Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => controller.geToNotification(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.redAccent),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentlyBooked extends StatelessWidget {
  const RecentlyBooked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const ListHotelView();
      },
    );
  }
}
