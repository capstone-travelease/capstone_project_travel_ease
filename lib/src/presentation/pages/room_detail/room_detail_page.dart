import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/booking/booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/room_detail/room_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/search_hotel/search_hotel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomDetailPage extends GetView<RoomDetailController> {
  static const String routeName = '/RoomDetailPage';
  const RoomDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: Column(
        children: [
          Stack(
            children: [
              SafeArea(
                child: Obx(() => CarouselSlider.builder(
                      itemCount: controller.listImage.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          SizedBox(
                        width: Get.width,
                        child: ExtendedImage.network(
                          controller.listImage[itemIndex],
                          fit: BoxFit.cover,
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
                      options: CarouselOptions(
                          viewportFraction: 1,
                          // pageSnapping: false,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              controller.activeIndex.value = index),
                    )),
              ),
              Positioned(
                top: 60,
                left: 10,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: 10,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.bookmark_outline_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 150,
                child: Obx(
                  () => AnimatedSmoothIndicator(
                    activeIndex: controller.activeIndex.value,
                    count: controller.listImage.length,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: Colors.deepOrangeAccent,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const GetFooter(),
    );
  }
}

class GetFooter extends StatelessWidget {
  const GetFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: Get.width,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DataSearch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(BookingPage.routeName),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(18)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 40),
                      child: Text(
                        'Book Room',
                        style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Total Price ', style: Get.textTheme.bodySmall!),
                    Text(
                      '4,600,000đ',
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('/ per night ', style: Get.textTheme.bodySmall!),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataSearch extends GetView<SearchHotelController> {
  const DataSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: controller.dateRange.value?.start.formatDateToString(),
            style: Get.textTheme.bodySmall
                ?.copyWith(color: Colors.black, fontSize: 12),
          ),
          TextSpan(
              text: ' - ',
              style: Get.textTheme.bodySmall
                  ?.copyWith(color: Colors.black, fontSize: 12)),
          TextSpan(
              text: controller.dateRange.value?.end.formatDateToString(),
              style: Get.textTheme.bodySmall
                  ?.copyWith(color: Colors.black, fontSize: 12)),
          TextSpan(
              text: ',${controller.numberRoom.value} Night(s)',
              style: Get.textTheme.bodySmall
                  ?.copyWith(color: Colors.black, fontSize: 12)),
          TextSpan(
              text: ',${controller.numberAdult.value} Room(s)',
              style: Get.textTheme.bodySmall
                  ?.copyWith(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }
}
