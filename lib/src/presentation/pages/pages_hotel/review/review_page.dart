import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/review/review_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPage extends GetView<ReviewController> {
  static const String routeName = '/ReviewPage';
  const ReviewPage({Key? key}) : super(key: key);
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
          'Review',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Rating ',
                      style: Get.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          '(${controller.listReview.length.toInt().toString()} reviews)',
                      style: Get.textTheme.titleMedium!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.listReview.length,
                  itemBuilder: (context, index) {
                    final item = controller.listReview[index];
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ExtendedImage.network(
                                  Constant.baseImageUrl +
                                      (item.imageUser ?? ''),
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.fullName ?? '',
                                              style: Get.textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              item.dateReview
                                                  .formatDateAndTimeToString(),
                                              style: Get.textTheme.bodyMedium!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.content ?? '',
                                    style: Get.textTheme.bodySmall!.copyWith(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.redAccent,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${item.starRating}',
                                            style: Get.textTheme.bodyMedium!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
