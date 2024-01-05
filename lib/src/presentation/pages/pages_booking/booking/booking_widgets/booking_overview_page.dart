import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingOverviewPage extends StatelessWidget {
  static const String routeName = '/BookingOverview';
  const BookingOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (controller) => Container(
        width: Get.width,
        height: Get.height,
        color: Get.theme.colorScheme.background,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HotelSelected(),
                const SizedBox(
                  height: 10,
                ),
                const SearchViewBooking(),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    const RoomDetail(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxes',
                            style: Get.textTheme.bodySmall!.copyWith(),
                          ),
                          Text(
                            '8%',
                            style: Get.textTheme.bodySmall?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          alignLabelWithHint: true,
                          hintText: 'Add your coupon code',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coupon',
                            style: Get.textTheme.bodySmall!.copyWith(),
                          ),
                          Text(
                            '-500,000đ',
                            style: Get.textTheme.bodySmall?.copyWith(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note',
                        style: Get.textTheme.titleMedium!.copyWith(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                              // color: context.theme.hintColor,
                              ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Fill your note',
                            hintStyle: context.theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Final price',
                          style: Get.textTheme.titleLarge!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => Text(
                            NumberFormat.currency(
                                    locale: 'vi_VN', symbol: 'VND')
                                .format(controller.room.value?.roomPrice),
                            style: Get.textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review your booking conditions',
                        style: Get.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Non-refundable',
                        style: Get.textTheme.bodyMedium!.copyWith(),
                      ),
                      Text(
                        'Cancellation is not allowed',
                        style: Get.textTheme.bodyMedium!.copyWith(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HotelSelected extends GetView<HotelDetailController> {
  const HotelSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  controller.hotelDetail.value?.hotelName ?? '',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
              ),
              Obx(() => RichText(
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
                              controller.hotelDetail.value?.hotelAddress ?? '',
                          style: Get.textTheme.bodySmall!.copyWith(),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: controller.hotelDetail.value?.hotelCity ?? '',
                          style: Get.textTheme.bodySmall!.copyWith(),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text:
                              controller.hotelDetail.value?.hotelCountry ?? '',
                          style: Get.textTheme.bodySmall!.copyWith(),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(
          () => Expanded(
            child: ExtendedImage.network(
              Constant.baseImageUrl,
              // (controller.hotelDetail.value?.images ?? ''),
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
        )
      ],
    );
  }
}

class SearchViewBooking extends GetView<SearchHotelController> {
  const SearchViewBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          const Divider(
            color: Colors.grey,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Check-in',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
                Text(
                  controller.dateRange.value!.start.formatDateToString(),
                  style: Get.textTheme.bodySmall?.copyWith(),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Check-out',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
                Text(
                  controller.dateRange.value!.end.formatDateToString(),
                  style: Get.textTheme.bodySmall?.copyWith(),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'For',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '${(controller.dateRange.value?.end.difference(controller.dateRange.value!.start))?.inDays} nights, ',
                        style: Get.textTheme.bodySmall!.copyWith(),
                      ),
                      TextSpan(
                        text: '${controller.numberAdult.value} room ',
                        style: Get.textTheme.bodySmall!.copyWith(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoomDetail extends GetView<BookingController> {
  const RoomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lựa Chọn Của bạn',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    controller.room.value?.roomName ?? '',
                    style: Get.textTheme.titleMedium!.copyWith(),
                  ),
                ),
                Obx(
                  () => Text(
                    NumberFormat.currency(locale: 'vi_VN', symbol: 'VND')
                        .format(controller.room.value?.roomPrice),
                    style: Get.textTheme.titleMedium?.copyWith(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
