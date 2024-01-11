import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/add_new_payment/add_new_payment_controller.dart';
import 'package:extended_image/extended_image.dart';
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
          onPressed: () => controller.back(),
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
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = controller.listBanks[index];
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () async {
                              controller.selectLocation(item);
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12),
                                child: InkWell(
                                  onTap: () => controller.selectLocation(item),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ExtendedImage.network(
                                            Constant.baseImageUserUrl +
                                                (item.imageBankUrl ?? ''),
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                            shape: BoxShape.rectangle,
                                            loadStateChanged:
                                                (ExtendedImageState state) {
                                              switch (state
                                                  .extendedImageLoadState) {
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
                                            width: 20,
                                          ),
                                          Text(
                                            item.nameBank ?? '',
                                            style: Get.textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        indent: 90,
                        endIndent: 20,
                        color: Colors.grey[400],
                        height: 0,
                      );
                    },
                    itemCount: controller.listBanks.length);
              },
            ),
          )
        ],
      ),
    );
  }
}
