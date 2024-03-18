import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/rating/rating_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingPage extends GetView<RatingController> {
  static const String routeName = '/RatingPage';

  const RatingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Rating',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Obx(
                        () => ExtendedImage.network(
                          Constant.baseImageUrl +
                              (controller.ticket.value?.fileUrl ?? ''),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => Text(
                              controller.ticket.value?.userName ?? '',
                              style: Get.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22.0,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check-In',
                              style: Get.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Check-Out',
                              style: Get.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.ticket.value?.checkInDate
                                          .formatDateAndTimeToString() ??
                                      '',
                                  style: Get.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.ticket.value?.checkOutDate
                                          .formatDateAndTimeToString() ??
                                      '',
                                  style: Get.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12),
                        child: Obx(
                          () => controller.ticket.value?.productList != null
                              ? ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: (controller
                                          .ticket.value?.productList?.length ??
                                      -1),
                                  itemBuilder: (context, index) {
                                    final item = controller
                                        .ticket.value?.productList?[index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'NumberRoom: ${item?.numberRoom.toString()}',
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Max Guests: ${item?.maxGuest.toString()}',
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      color: Colors.grey,
                                    );
                                  },
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rate your experience',
                    style: Get.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            Icons.star_rate,
                            color:
                                index < controller.selectedRating.value.toInt()
                                    ? Colors.red
                                    : Colors.grey,
                          ),
                          onPressed: () {
                            controller.updateRating(index + 1);
                          },
                        );
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                      key: controller.keyForm,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmtys.name);
                          }
                          return null;
                        },
                        controller: controller.contentEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Comment',
                          hintStyle:
                              context.theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey[500],
                          ),
                        ),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => controller.onSend(
                    hotelId: controller.ticket.value!.hotelId ?? -1),
                child: SizedBox(
                  width: Get.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.redAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
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
    );
  }
}
