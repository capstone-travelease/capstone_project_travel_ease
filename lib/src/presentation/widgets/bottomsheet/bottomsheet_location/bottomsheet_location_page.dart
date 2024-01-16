import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/bottomsheet_location/bottomsheet_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetLocation extends StatelessWidget {
  const BottomSheetLocation({Key? key, this.location}) : super(key: key);
  final LocationModel? location;
  static const String routeName = '/BottomSheetLocation';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetLocationController>(
      init: BottomSheetLocationController(initialValue: location),
      builder: (controller) {
        controller.selectedLocation.value = location;
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Text(
                          'Hủy',
                          style: Get.textTheme.bodyLarge!.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        'Chọn Thành Phố',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(''),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: context.theme.textTheme.titleMedium?.copyWith(),
                    onSubmitted: (v) async {
                      await controller.searchData(keySearch: v, refresh: true);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      isCollapsed: true,
                      alignLabelWithHint: true,
                      suffixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      hintStyle: context.theme.textTheme.bodyLarge
                          ?.copyWith(color: Colors.grey.withOpacity(0.6)),
                      // errorText: controller.noiDungError.value,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = controller.listLocation[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.selectLocation(item);
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: controller.selectedLocation.value ==
                                            item
                                        ? Colors.red[50]
                                        : null,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.placeName ?? '',
                                          style: Get.textTheme.bodyMedium,
                                        ),
                                        if (controller.selectedLocation.value ==
                                            item)
                                          Icon(
                                            Icons.check,
                                            color: Colors.green[800],
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          final previousItem = controller.listLocation[index];
                          final nextItem = controller.listLocation[index + 1];
                          return Obx(
                            () => Divider(
                              indent: 20,
                              endIndent: 20,
                              color: controller.selectedLocation.value ==
                                          previousItem ||
                                      controller.selectedLocation.value ==
                                          nextItem
                                  ? Colors.transparent
                                  : Colors.grey[400],
                              height: 0,
                            ),
                          );
                        },
                        itemCount: controller.listLocation.length,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
