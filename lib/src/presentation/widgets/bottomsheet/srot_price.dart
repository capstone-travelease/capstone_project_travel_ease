import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/filter/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortPriceWidget extends StatelessWidget {
  final String priceFromLowToHigh;
  final String priceFromHighToLow;
  const SortPriceWidget({
    super.key,
    required this.priceFromLowToHigh,
    required this.priceFromHighToLow,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(
        initialSortHighValue: priceFromHighToLow,
        initialSortLowValue: priceFromLowToHigh,
      ),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      'Sort',
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () => controller.resetSortPrice(),
                      child: Text(
                        'Reset all',
                        style: Get.textTheme.bodySmall!
                            .copyWith(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.sortPrice.length,
                  itemBuilder: (context, index) {
                    final item = controller.sortPrice[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => controller.selectSortPrice(item),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Icon(
                                Icons.radio_button_checked_rounded,
                                color:
                                    controller.selectedSortPrice.value == item
                                        ? Colors.redAccent
                                        : null,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              item,
                              style: Get.textTheme.titleLarge!.copyWith(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
