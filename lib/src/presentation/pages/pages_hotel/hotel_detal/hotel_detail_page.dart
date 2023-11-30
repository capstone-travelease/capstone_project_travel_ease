import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelDetailPage extends GetView<HotelDetailController> {
  const HotelDetailPage({Key? key}) : super(key: key);
  static const String routeName = '/HotelDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: Hero(
        tag: UniqueKey(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              fit: BoxFit.fill,
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
                    top: 70,
                    left: 10,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        size: 30,
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 10,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        size: 40,
                        Icons.bookmark_outline_outlined,
                        color: Colors.white,
                      ),
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
              const AddressView(),
              const Facilities(),
              const Review(),
              const Description(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GetFooter(),
    );
  }
}

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Royale President Hotel',
              style: Get.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.redAccent,
                    ),
                  ),
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    text:
                        '2 Đường C - Bắc, Tân Phú, Quận 7, Thành phố Hồ Chí Minh, Việt Nam',
                    style: Get.textTheme.bodySmall!
                        .copyWith(color: Colors.grey[500]),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Divider(
              indent: 6,
              height: 2,
              color: Colors.grey[350]!,
              endIndent: 6,
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class Facilities extends StatelessWidget {
  const Facilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Facilities',
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 220,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 8),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), //<-- SEE HERE
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.hotel_class,
                          color: Colors.deepOrangeAccent,
                        ),
                        Text(
                          'item item',
                          style: Get.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Review score',
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '4.9',
                            style: Get.textTheme.headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                          TextSpan(
                            text: '/5.0',
                            style: Get.textTheme.bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '20 review',
                  style: Get.textTheme.bodySmall!
                      .copyWith(color: Colors.grey[500]),
                ),
                Text(
                  'Read reviews',
                  style: Get.textTheme.bodyMedium!
                      .copyWith(color: Colors.redAccent),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class Description extends GetView<HotelDetailController> {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Location',
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () => controller.openGoogleMapsApp(10.794670, 106.709151),
            child: SizedBox(
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: IgnorePointer(
                  child: FlutterMap(
                    options: MapOptions(
                        initialZoom: controller.zoomLevel,
                        initialCenter: controller.currentLocation,
                        minZoom: controller.zoomLevel,
                        maxZoom: controller.zoomLevel,
                        onTap: null),
                    children: [
                      TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: controller.currentLocation,
                            width: 80,
                            height: 80,
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 45,
                                ),
                                Text(
                                  'Hotel Name',
                                  style: Get.textTheme.bodySmall!.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Description',
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: controller.isExpanded.value
                            ? controller.fullText
                            : (controller.fullText.length > 200
                                ? controller.fullText.substring(0, 200)
                                : controller.fullText),
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                          color: Get.theme.colorScheme.onSurface,
                        ),
                      ),
                      if (controller.fullText.length > 200)
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.toggleExpanded,
                          text: controller.isExpanded.value
                              ? ' Read Less'
                              : ' Read More..',
                          style: Get.theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GetFooter extends StatelessWidget {
  const GetFooter({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.toNamed(ListRoomPage.routeName),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Select Room',
                    style: Get.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '4,600,000đ',
                    style: Get.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text: '\n/per night', style: Get.textTheme.bodySmall!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
