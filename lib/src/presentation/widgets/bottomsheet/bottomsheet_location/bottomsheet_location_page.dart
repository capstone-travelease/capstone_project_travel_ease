import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/bottomsheet_location/bottomsheet_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetLocation extends StatelessWidget {
  final String? location;
  const BottomSheetLocation({Key? key, this.location}) : super(key: key);
  static const String routeName = '/BottomSheetLocation';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetLocationController>(
      init: BottomSheetLocationController(),
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
              Obx(() => ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = controller.listItem[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Obx(
                        () => InkWell(
                          onTap: () {
                            controller.selectLocation(item);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: controller.selectedLocation.value == item
                                  ? Border.all(
                                      color: Colors.redAccent,
                                    )
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
                                    item,
                                    style: Get.textTheme.bodyMedium,
                                  ),
                                  if (controller.selectedLocation.value == item)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.greenAccent,
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
                    final previousItem = controller.listItem[index];
                    final nextItem = controller.listItem[index + 1];
                    return Obx(
                      () => Divider(
                        indent: 20,
                        endIndent: 20,
                        color: controller.selectedLocation.value ==
                                    previousItem ||
                                controller.selectedLocation.value == nextItem
                            ? Colors.transparent
                            : Colors.grey[400],
                        height: 0,
                      ),
                    );
                  },
                  itemCount: controller.listItem.length))
            ],
          ),
        );
      },
    );
  }
}
