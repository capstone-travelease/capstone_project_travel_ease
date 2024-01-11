import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/domain/models/bank_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/add_new_payment/add_new_payment_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FinishBookingPage extends StatelessWidget {
  static const String routeName = '/BookingOverview';
  const FinishBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (controller) => Container(
        width: Get.width,
        height: Get.height,
        color: Get.theme.colorScheme.background,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Payment(),
                BookingInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Payment extends GetView<BookingController> {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListPaymentMethod(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            width: Get.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment',
                          style: Get.textTheme.titleMedium!.copyWith(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 12),
                          child: Obx(
                            () => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listBanksAccount.length,
                              itemBuilder: (context, index) {
                                var item = controller.listBanksAccount[index];
                                if (controller.selectedPaymentMethod.value
                                            ?.type ==
                                        item.bankType &&
                                    item.bankType == 1) {
                                  return WidgetBankAccount(
                                    banksModel: item,
                                  );
                                } else if (controller.selectedPaymentMethod
                                            .value?.type ==
                                        item.bankType &&
                                    item.bankType == 2) {
                                  return WidgetBankAccount(banksModel: item);
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(
                          AddNewPaymentPage.routeName,
                          arguments: {
                            "roomId":
                                controller.selectedPaymentMethod.value?.type ??
                                    -1
                          },
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.redAccent.withOpacity(0.9)),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.wallet,
                                      color: Colors.white,
                                    ),
                                    Obx(
                                      () => Text(
                                        controller.selectedPaymentMethod.value
                                                    ?.type ==
                                                1
                                            ? ' Add New E-Wallet'
                                            : ' Add New Bank',
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
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
            ),
          ),
        )
      ],
    );
  }
}

class ListPaymentMethod extends GetView<BookingController> {
  const ListPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment method',
                style: Get.textTheme.titleMedium!.copyWith(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Choose a payment method',
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listPayment.length,
                        itemBuilder: (context, index) {
                          var item = controller.listPayment[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10),
                            child: Column(
                              children: [
                                Obx(
                                  () => InkWell(
                                    onTap: () =>
                                        controller.selectPaymentMethod(item),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            color: controller
                                                        .selectedPaymentMethod
                                                        .value ==
                                                    item
                                                ? Colors.redAccent.shade100
                                                : Colors.grey[300]!,
                                            width: 2),
                                      ),
                                      child: Icon(item.icon),
                                    ),
                                  ),
                                ),
                                Text(
                                  item.namePay,
                                  style: Get.textTheme.bodySmall!.copyWith(),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingInformation extends GetView<BookingController> {
  const BookingInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.nameEditController.text,
                style: Get.textTheme.titleMedium!.copyWith(),
              ),
              Text(
                controller.emailEditController.text,
                style: Get.textTheme.bodyMedium!.copyWith(),
              ),
              Text(
                controller.phoneEditController.text,
                style: Get.textTheme.bodyMedium!.copyWith(),
              ),
              const HotelSelect(),
              DataSearchFinish(
                roomQuantity: controller.numberRoom,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Text(
                      'Final price: ',
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => Text(
                        NumberFormat.currency(locale: 'vi_VN', symbol: 'VND')
                            .format(controller.totalPrice.toInt()),
                        style: Get.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelSelect extends GetView<HotelDetailController> {
  const HotelSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      controller.hotelDetail.value?.hotelName ?? "",
      style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class DataSearchFinish extends GetView<SearchHotelController> {
  const DataSearchFinish({Key? key, required this.roomQuantity})
      : super(key: key);
  final int roomQuantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rooms : $roomQuantity ',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
                Text(
                  'Max guests:  ${controller.numberAdult.value}',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
                const Text('')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetBankAccount extends GetView<BookingController> {
  const WidgetBankAccount({Key? key, required this.banksModel})
      : super(key: key);
  final BanksModel banksModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => controller.selectPayment(banksModel),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ExtendedImage.network(
                  Constant.baseImageUserUrl + (banksModel.imageBankUrl ?? ''),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
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
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banksModel.accountName ?? '',
                      style: Get.textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      banksModel.accountNumber ?? '',
                      style: Get.textTheme.bodySmall!
                          .copyWith(color: Colors.grey[500]),
                    ),
                  ],
                )
              ],
            ),
            Obx(
              () => Icon(
                controller.selectedPayment.value == banksModel
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: controller.selectedPayment.value == banksModel
                    ? Colors.redAccent
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
