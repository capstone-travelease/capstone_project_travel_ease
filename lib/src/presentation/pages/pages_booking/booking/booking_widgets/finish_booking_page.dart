import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                PaymentMethod(),
                BookingInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentMethod extends GetView<BookingController> {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                                          onTap: () => controller
                                              .selectPaymentMethod(item),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                  color: controller
                                                              .selectedPaymentMethod
                                                              .value ==
                                                          item
                                                      ? Colors
                                                          .redAccent.shade100
                                                      : Colors.grey[300]!,
                                                  width: 2),
                                            ),
                                            child: Icon(item.icon),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        item.namePay,
                                        style:
                                            Get.textTheme.bodySmall!.copyWith(),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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
                        Obx(
                          () => Text(
                            controller.selectedPaymentMethod.value!.id != 3
                                ? 'Payment'
                                : 'Payment with QR code ',
                            style: Get.textTheme.titleMedium!.copyWith(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 12),
                          child: Obx(() => ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.selectedPaymentMethod
                                    .value?.children.length,
                                itemBuilder: (context, index) {
                                  var item = controller.selectedPaymentMethod
                                      .value?.children[index];
                                  if (controller
                                          .selectedPaymentMethod.value?.id ==
                                      3) {
                                    return Column(
                                      children: [
                                        Image.asset(
                                          item!.image,
                                          fit: BoxFit.cover,
                                          width: 220,
                                          height: 220,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          item.name,
                                          style: Get.textTheme.bodyLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Obx(
                                        () => InkWell(
                                          onTap: () =>
                                              controller.selectPayment(item),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    item!.image,
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item.name,
                                                        style: Get.textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Text(
                                                        controller
                                                            .nameEditController
                                                            .text,
                                                        style: Get.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Text(
                                                        item.soTaiKhoan,
                                                        style: Get.textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Icon(
                                                controller.selectedPayment
                                                            .value ==
                                                        item
                                                    ? Icons.check_circle
                                                    : Icons.circle_outlined,
                                                color: controller
                                                            .selectedPayment
                                                            .value ==
                                                        item
                                                    ? Colors.redAccent
                                                    : null,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              )),
                        )
                      ],
                    ),
                    Obx(() => controller.selectedPaymentMethod.value!.id != 3
                        ? Center(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.wallet,
                                          color: Colors.white,
                                        ),
                                        Obx(() => Text(
                                              controller.selectedPaymentMethod
                                                          .value?.id ==
                                                      1
                                                  ? ' Add New E-Wallet'
                                                  : ' Add New Bank',
                                              style: Get.textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: Colors.white),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink())
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
              Text(
                'Royale President Hotel',
                style: Get.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const DataSearchFinish(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Text(
                      'Final price: ',
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '4,600,000đ',
                      style: Get.textTheme.titleLarge?.copyWith(),
                    ),
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

class DataSearchFinish extends GetView<SearchHotelController> {
  const DataSearchFinish({Key? key}) : super(key: key);

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
                  'Rooms : ${controller.numberRoom.value} ',
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
