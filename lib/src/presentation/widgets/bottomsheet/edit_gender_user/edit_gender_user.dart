import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/edit_gender_user/eidt_gender_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetEditGenderUser extends StatelessWidget {
  const BottomSheetEditGenderUser({Key? key, this.gender}) : super(key: key);
  final String? gender;

  static const String routeName = '/BottomSheetLocation';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetEditGenderUserController>(
      init: BottomSheetEditGenderUserController(initialValue: gender),
      builder: (controller) {
        return Container(
          height: Get.height * 0.3,
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
                        'Chọn Giới Tính',
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
              Expanded(
                child: Scrollbar(
                  child: Obx(
                    () {
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = controller.listGender[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Obx(
                                () => InkWell(
                                  onTap: () {
                                    controller.selectLocation(item);
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: controller.selectedGender.value ==
                                              item
                                          ? Colors.red[50]
                                          : null,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            fit: FlexFit.tight,
                                            child: InkWell(
                                              onTap: () => Get.back(),
                                              child: const Text(
                                                '',
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 2,
                                            fit: FlexFit.tight,
                                            child: Text(
                                              item,
                                              textAlign: TextAlign.center,
                                              style: Get.textTheme.titleMedium!
                                                  .copyWith(),
                                            ),
                                          ),
                                          Flexible(
                                              flex: 1,
                                              fit: FlexFit.tight,
                                              child: controller.selectedGender
                                                          .value ==
                                                      item
                                                  ? Icon(
                                                      Icons.check,
                                                      color: Colors.green[800],
                                                    )
                                                  : const SizedBox.shrink()),
                                        ],
                                      ),
                                      // child: Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text(
                                      //       item ?? '',
                                      //       style: Get.textTheme.bodyMedium,
                                      //     ),
                                      //)
                                      //       Icon(
                                      //         Icons.check,
                                      //         color: Colors.green[800],
                                      //       )
                                      //   ],
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            final previousItem = controller.listGender[index];
                            final nextItem = controller.listGender[index + 1];
                            return Obx(
                              () => Divider(
                                indent: 20,
                                endIndent: 20,
                                color: controller.selectedGender.value ==
                                            previousItem ||
                                        controller.selectedGender.value ==
                                            nextItem
                                    ? Colors.transparent
                                    : Colors.grey[400],
                                height: 0,
                              ),
                            );
                          },
                          itemCount: controller.listGender.length);
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
