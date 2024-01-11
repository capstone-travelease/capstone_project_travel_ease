import 'package:capstone_project_travel_ease/src/presentation/widgets/bottomsheet/bottomsheet_room_adult/bottomsheet_room_adult_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetRoomAdultPage extends StatelessWidget {
  final int? roomNumber;
  final int? adultNumber;
  const BottomSheetRoomAdultPage({Key? key, this.roomNumber, this.adultNumber})
      : super(key: key);
  static const String routeName = '/BottomSheetRoomAdultPage';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomSheetRoomAdultController>(
      init: BottomSheetRoomAdultController(),
      builder: (controller) {
        controller.numberRoom.value = roomNumber ?? -1;
        controller.numberAdult.value = adultNumber ?? -1;
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Room(s) and Guest(s)',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.redAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.meeting_room_outlined,
                                size: 38,
                              ),
                              Text(
                                ' Room(s) ',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => controller.decrementRoom(),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Obx(
                                        () => Icon(
                                          Icons.remove,
                                          color:
                                              controller.numberRoom.value == 0
                                                  ? Colors.grey
                                                  : Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => Text(
                                    controller.numberRoom.toString(),
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () => controller.incrementRoom(),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.people_outline_sharp,
                                size: 38,
                              ),
                              Text(
                                ' Adult(s) ',
                                textAlign: TextAlign.center,
                                style: Get.textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => controller.decrementAdult(),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Obx(
                                        () => Icon(
                                          Icons.remove,
                                          color:
                                              controller.numberAdult.value == 0
                                                  ? Colors.grey
                                                  : Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => Text(
                                    controller.numberAdult.toString(),
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () => controller.incrementAdult(),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[400],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Attentive: * ',
                              style: Get.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            TextSpan(
                              text:
                                  'Children 12 years and older are considered Adults.',
                              style: Get.textTheme.bodyLarge!.copyWith(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 40),
                  child: InkWell(
                    onTap: () {
                      if (controller.numberAdult.value <
                          controller.numberRoom.value) {
                        controller.tinTucConfig.showSnackBar(
                            title: 'Thông báo',
                            'Số Phòng Không Thể Nhiều Hơn Số Khách',
                            backgroundColor: Colors.red);
                      } else {
                        Get.back(
                          result: [
                            controller.numberRoom.value,
                            controller.numberAdult.value
                          ],
                        );
                      }
                    },
                    child: SizedBox(
                      width: Get.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style: Get.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
