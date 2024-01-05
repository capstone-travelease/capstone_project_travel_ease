import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/add_new_payment/add_new_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPaymentPage extends GetView<AddNewPaymentController> {
  static const String routeName = '/AddNewPaymentPage';
  const AddNewPaymentPage({Key? key}) : super(key: key);

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
          'Add New Payment',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Scrollbar(
            child: Obx(
              () {
                // if (controller.isLoading.value) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = controller.listPayment[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(
                          () => InkWell(
                            onTap: () async {
                              controller.selectLocation(item);
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: controller.selectedPayment.value == item
                                    ? Colors.red[50]
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: InkWell(
                                  onTap: () => controller.selectedPayment(item),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            item.image,
                                            width: 30,
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            item.name,
                                            style: Get.textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Icon(
                                        controller.selectedPayment.value == item
                                            ? Icons.check
                                            : null,
                                        color:
                                            controller.selectedPayment.value ==
                                                    item
                                                ? Colors.green
                                                : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      final previousItem = controller.listPayment[index];
                      final nextItem = controller.listPayment[index + 1];
                      return Obx(
                        () => Divider(
                          indent: 20,
                          endIndent: 20,
                          color: controller.selectedPayment.value ==
                                      previousItem ||
                                  controller.selectedPayment.value == nextItem
                              ? Colors.transparent
                              : Colors.grey[400],
                          height: 0,
                        ),
                      );
                    },
                    itemCount: controller.listPayment.length);
              },
            ),
          )
        ],
      ),
    );
  }
}
