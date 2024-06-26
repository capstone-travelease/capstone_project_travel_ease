import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:capstone_project_travel_ease/src/domain/models/search_hotel_information.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/search_hotel_widget/widget_search_hotel.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends GetView<HomeController> {
  static const String routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  onTap: () => controller.geToNotification(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                        color: Colors.white),
                    child: WidgetSearchHotelPage(
                      title: 'Search Your Hotel',
                      onChange: (SearchModel data) async {
                        await Get.toNamed(
                          SearchHotelPage.routeName,
                          preventDuplicates: false,
                          arguments: ArgSearchHotel(
                            dateTimeRange: DateTimeRange(
                              end: data.todDay!,
                              start: data.fromDay!,
                            ),
                            location: data.location ?? '',
                            numberRoom: data.numberRoom ?? 0,
                            numberAdult: data.numberAdult ?? 0,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Hotel',
                    style: Get.textTheme.titleMedium!.copyWith(),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.35,
                  child: Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.proposeHotel.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = controller.proposeHotel[index];
                        return SizedBox(
                          width: Get.width * 0.7,
                          child: InkWell(
                            onTap: () => Get.toNamed(
                              HotelDetailPage.routeName,
                              arguments: ArgSearchHotel(
                                hotelId: item.hotelId,
                                dateTimeRange: DateTimeRange(
                                  end: DateTime.now()
                                      .add(const Duration(days: 1)),
                                  start: DateTime.now(),
                                ),
                                location: item.hotelCity ?? '',
                                numberRoom: 1,
                                numberAdult: 2,
                              ),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Positioned.fill(
                                  child: ExtendedImage.network(
                                    Constant.baseImageUrl +
                                        (item.images!.first.imageUrl ?? ''),
                                    fit: BoxFit.cover,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    shape: BoxShape.rectangle,
                                    loadStateChanged:
                                        (ExtendedImageState state) {
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
                                  ),
                                ),
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
                                            item.starRating.toString(),
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
                                  left: 12,
                                  right: 0,
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.hotelName ?? '',
                                            style: Get.textTheme.titleMedium!
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
                                                item.hotelCity ?? '',
                                                style: Get.textTheme.titleSmall!
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
                                            '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(item.price)} /per night',
                                            style: Get.textTheme.titleSmall!
                                                .copyWith(
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
      ),
    );
  }
}

class AppBar extends GetView<CheckLoginController> {
  const AppBar({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(() => controller.isLogin.value != false
                  ? ClipOval(
                      child: ExtendedImage.network(
                        Constant.baseImageUserUrl +
                            (controller.user.value?.avatar ?? ''),
                        width: Get.width * 0.12,
                        height: Get.width * 0.12,
                        fit: BoxFit.cover,
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
                                width: Get.width * 0.12,
                                height: Get.width * 0.12,
                                fit: BoxFit.cover,
                                Assets.images.noImageUser.path,
                              );
                          }
                        },
                      ),
                    )
                  : const SizedBox.shrink()),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => controller.isLogin.value == false
                    ? controller.pushLogin()
                    : {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        controller.isLogin.value != false
                            ? 'Hello'
                            : 'Sign in / Sign Up now',
                        style: Get.textTheme.titleMedium?.copyWith(
                            color: controller.isLogin.value != false
                                ? Colors.grey
                                : null),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.user.value?.fullName ??
                            'to receive more coupon',
                        style: Get.textTheme.titleSmall?.copyWith(
                            color: controller.isLogin.value != false
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
            onTap: onTap,
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
