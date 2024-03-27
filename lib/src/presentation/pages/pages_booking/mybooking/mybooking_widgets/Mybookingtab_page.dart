import 'package:capstone_project_travel_ease/src/domain/models/my_booking_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/rating/rating_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/ticket/ticket_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/custom_no_data_widget.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/list_hotel_mybooking.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/loading_shimmer_hotel.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/mybooking_unpaid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyBookingTab extends GetView<MyBookingController> {
  const MyBookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.checkLoginController.isLogin.value != false
          ? PagedListView<int, MyBookingModel>.separated(
              shrinkWrap: true,
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (
                  BuildContext context,
                  MyBookingModel item,
                  int index,
                ) {
                  final itemBooking = controller.listBooking[index];
                  return Obx(
                    () {
                      if (controller.selected.value?.type.title == 'Unpaid') {
                        return UnpaidBooking(
                          myBooking: item,
                        );
                      } else {
                        return ListHotelMyBooking(
                          decoratedBox: DecoratedBox(
                            decoration: BoxDecoration(
                              color: controller.selected.value?.type.title ==
                                      'Cancelled'
                                  ? Colors.red[50]
                                  : Colors.green[50],
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6.0,
                                horizontal: 12,
                              ),
                              child: Obx(
                                () => Text(
                                  controller.selected.value?.status ?? '',
                                  style: Get.textTheme.bodySmall?.copyWith(
                                    color:
                                        controller.selected.value?.type.title ==
                                                'Cancelled'
                                            ? Colors.red
                                            : Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          myBooking: item,
                          onTap: () => Get.toNamed(
                            TicketPage.routeName,
                            arguments: {
                              'bookingId': itemBooking.bookingId,
                              'bookingType': itemBooking.bookingStatus,
                            },
                          ),
                          text: controller.selected.value?.type.title ==
                                  'Completed'
                              ? TextButton(
                                  onPressed: () => Get.toNamed(
                                      RatingPage.routeName,
                                      arguments: {
                                        'bookingId': itemBooking.bookingId,
                                      }),
                                  child: Text(
                                    'Rate now',
                                    style: Get.textTheme.bodySmall!.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : null,
                        );
                      }
                    },
                  );
                },
                noItemsFoundIndicatorBuilder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Image.asset(
                          width: 200,
                          fit: BoxFit.contain,
                          controller.selected.value?.image ?? '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          controller.selected.value?.textNoLogin ?? '',
                          style: Get.textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
                firstPageProgressIndicatorBuilder: (context) {
                  return const LoadingShimmerHotel();
                },
                newPageProgressIndicatorBuilder: (context) => SizedBox(
                  height: 30,
                  child: Center(
                    child: CupertinoActivityIndicator(
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                ),
                firstPageErrorIndicatorBuilder: (context) =>
                    const CustomNoDataWidget(
                  noiDung: 'Không có dữ liệu',
                  isSearch: false,
                ),
                newPageErrorIndicatorBuilder: (context) =>
                    const CustomNoDataWidget(
                  noiDung: 'Có lỗi xảy ra. Vui lòng thử lại!',
                  isSearch: false,
                ),
              ),
              separatorBuilder: (_, __) => const Divider(
                endIndent: 0,
                thickness: 1,
                indent: 0,
                height: 0,
                color: Colors.transparent,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      fit: BoxFit.contain,
                      controller.selected.value?.image ?? '',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    controller.selected.value?.textNoLogin ?? '',
                    style: Get.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}
