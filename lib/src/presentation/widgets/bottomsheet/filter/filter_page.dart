import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/filter/filter_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);
  static const String routeName = '/FilterPage';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Filter',
                      style: Get.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reset all',
                        style: Get.textTheme.bodySmall!
                            .copyWith(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
              const RangePriceRoom(),
              const CustomerReview(),
              const Facilities()
            ],
          ),
        );
      },
    );
  }
}

class RangePriceRoom extends GetView<FilterController> {
  const RangePriceRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Price range per room, per night',
            style: Get.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey[400]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(
                  () => DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 8),
                      child: Center(
                        child: Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: 'VND')
                              .format(controller.minPrice.value),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '-',
                style:
                    Get.textTheme.bodyLarge!.copyWith(color: Colors.redAccent),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Obx(
                  () => DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 8),
                      child: Center(
                          child: Text(
                        NumberFormat.currency(locale: 'vi_VN', symbol: 'VND')
                            .format(controller.maxPrice.value),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => RangeSlider(
            activeColor: Colors.red,
            inactiveColor: Colors.grey[300],
            divisions: 10,
            values: RangeValues(
                controller.minPrice.value, controller.maxPrice.value),
            min: 0.0,
            max: 50000000.0,
            onChanged: (RangeValues values) {
              controller.updatePriceRange(values.start, values.end);
            },
          ),
        ),
      ],
    );
  }
}

class CustomerReview extends GetView<FilterController> {
  const CustomerReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Customer review',
            style: Get.textTheme.bodyMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey[400]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: controller.dsStar.length,
                itemBuilder: (context, index) {
                  var item = controller.dsStar[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Obx(() => InkWell(
                          onTap: () => controller.selectStar(item),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: controller.selectedStar.value == item
                                    ? Colors.redAccent
                                    : null,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: Colors.redAccent)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_purple500_outlined,
                                    color: controller.selectedStar.value == item
                                        ? Colors.white
                                        : null,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    item.toString(),
                                    style: Get.textTheme.bodySmall?.copyWith(
                                      color:
                                          controller.selectedStar.value == item
                                              ? Colors.white
                                              : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class Facilities extends GetView<FilterController> {
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
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 8),
                itemCount: controller.facilitiesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final item = controller.facilitiesList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () => controller.selectListFacilities(item),
                        child: Obx(() => DecoratedBox(
                              decoration: BoxDecoration(
                                  color: controller.selectedFacilities
                                          .contains(item)
                                      ? Colors.redAccent
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.redAccent)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ExtendedImage.network(
                                      Constant.baseImageUrl +
                                          (item.facilityImage ?? ''),
                                      width: 24,
                                      height: 24,
                                      color: controller.selectedFacilities
                                              .contains(item)
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6),
                                      ),
                                      shape: BoxShape.rectangle,
                                      loadStateChanged:
                                          (ExtendedImageState state) {
                                        switch (state.extendedImageLoadState) {
                                          case LoadState.loading:
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
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
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          item.facilityName ?? '',
                                          textAlign: TextAlign.center,
                                          style: Get.textTheme.bodySmall
                                              ?.copyWith(
                                                  fontSize: 11,
                                                  color: controller
                                                          .selectedFacilities
                                                          .contains(item)
                                                      ? Colors.white
                                                      : null,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                  );
                },
              )),
        ),
      ],
    );
  }
}
