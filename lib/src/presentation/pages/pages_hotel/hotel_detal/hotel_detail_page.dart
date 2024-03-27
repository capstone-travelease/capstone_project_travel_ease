import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/facilities_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/review/review_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                    child: Obx(
                      () => CarouselSlider.builder(
                        itemCount:
                            (controller.hotelDetail.value?.images?.length ??
                                -1),
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          final item =
                              controller.hotelDetail.value?.images?[itemIndex];
                          return SizedBox(
                            width: Get.width,
                            child: ExtendedImage.network(
                              Constant.baseImageUrl + (item?.imageUrl ?? ''),
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
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 1,
                          // pageSnapping: false,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              controller.activeIndex.value = index,
                        ),
                      ),
                    ),
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
                  if ((controller.hotelDetail.value?.images?.length ?? -1) > 1)
                    Positioned(
                      bottom: 10,
                      right: 150,
                      child: Obx(
                        () => AnimatedSmoothIndicator(
                          activeIndex: controller.activeIndex.value,
                          count: controller.hotelDetail.value?.images?.length ??
                              -1,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const AddressView(),
                    Obx(
                      () => controller.hotelDetail.value?.facilities != null
                          ? Facilities(
                              facilitiesModel:
                                  controller.hotelDetail.value?.facilities ??
                                      [])
                          : const SizedBox.shrink(),
                    ),
                    const Review(),
                    const Description(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GetFooter(),
    );
  }
}

class AddressView extends GetView<HotelDetailController> {
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
            child: Obx(
              () => Text(
                controller.hotelDetail.value?.hotelName ?? '',
                style: Get.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => RichText(
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
                      text: controller.hotelDetail.value?.hotelAddress ?? '',
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: controller.hotelDetail.value?.hotelCity ?? '',
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.grey[500],
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: controller.hotelDetail.value?.hotelCountry ?? '',
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.grey[500],
                      ),
                    )
                  ],
                ),
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
  const Facilities({Key? key, required this.facilitiesModel}) : super(key: key);
  final List<FacilitiesModel> facilitiesModel;
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
            height: Get.height * 0.1,
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: facilitiesModel.length,
              itemBuilder: (context, index) {
                final item = facilitiesModel[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExtendedImage.network(
                          Constant.baseImageUrl + (item.facilityImage ?? ''),
                          width: 24,
                          height: 24,
                          color: Colors.redAccent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
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
                                  Assets.images.nodata.path,
                                  fit: BoxFit.cover,
                                );
                            }
                          },
                        ),
                        Text(
                          item.facilityName ?? '',
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

class Review extends GetView<HotelDetailController> {
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
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
                    child: Obx(() => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: controller.hotelDetail.value?.starRating
                                    .toString(),
                                style: Get.textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: '/5.0',
                                style: Get.textTheme.bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        )),
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
                TextButton(
                    onPressed: () => Get.toNamed(ReviewPage.routeName,
                            arguments: {
                              'hotelId': controller.hotelDetail.value?.hotelId
                            }),
                    child: Text(
                      'Read reviews',
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: Colors.redAccent,
                      ),
                    ))
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
            style: Get.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
                      onTap: null,
                    ),
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
                                  size: 18,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.hotelDetail.value?.hotelName ??
                                        '',
                                    style: Get.textTheme.bodySmall!.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                            ? controller.hotelDetail.value?.hotelDescription
                            : ((controller.hotelDetail.value?.hotelDescription
                                            ?.length ??
                                        -1) >
                                    200
                                ? controller.hotelDetail.value?.hotelDescription
                                    ?.substring(0, 200)
                                : controller
                                    .hotelDetail.value?.hotelDescription),
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                          color: Get.theme.colorScheme.onSurface,
                        ),
                      ),
                      if ((controller.hotelDetail.value?.hotelDescription
                                  ?.length ??
                              -1) >
                          200)
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

class GetFooter extends GetView<HotelDetailController> {
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
              onTap: () => Get.toNamed(
                ListRoomPage.routeName,
                preventDuplicates: false,
                arguments: ArgListRoom(
                  location: controller.hotelDetail.value?.hotelCity ?? '',
                  hotelName: controller.hotelDetail.value?.hotelName ?? '',
                  hotelId: controller.hotelDetail.value?.hotelId ?? -1,
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(12)),
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
            Obx(() => RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: controller.hotelDetail.value?.price == null
                            ? '200000'
                            : NumberFormat.currency(
                                    locale: 'vi_VN', symbol: 'VND')
                                .format(controller.hotelDetail.value?.price),
                        style: Get.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: '\n/per night',
                          style: Get.textTheme.bodySmall!),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
