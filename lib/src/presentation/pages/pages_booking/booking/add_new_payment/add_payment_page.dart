import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/domain/models/bank_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_add_card_body.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/add_new_payment/add_new_payment_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPay extends StatelessWidget {
  static const String routeName = '/AddPay';
  const AddPay({Key? key, required this.banksModel}) : super(key: key);
  final BanksModel banksModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewPaymentController>(
      init: AddNewPaymentController(),
      builder: (controller) {
        return Dialog(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Get.theme.colorScheme.background,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Thông Tin Liên Kết",
                    style: Get.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red[100]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                fit: BoxFit.fill,
                                Assets.images.noImageUser.path,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            const Icon(
                              Icons.insert_link_outlined,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            ExtendedImage.network(
                              Constant.baseImageUserUrl +
                                  (banksModel.imageBankUrl ?? ''),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6),
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
                                      Assets.images.nodata.path,
                                      fit: BoxFit.cover,
                                    );
                                }
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                banksModel.nameBank ?? '',
                                style: Get.textTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextLink(
                    text: banksModel.nameBank ?? '',
                    bankId: banksModel.bankId ?? -1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TextLink extends GetView<AddNewPaymentController> {
  const TextLink({Key? key, required this.text, required this.bankId})
      : super(key: key);
  final String text;
  final int bankId;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Số Tài Khoản',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return value.checkEmpty(ErrorAndIsEmtys.email);
              }
              return null;
            },
            controller: controller.stkEditController,
            style: context.theme.textTheme.bodyMedium?.copyWith(
                // color: context.theme.hintColor,
                ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Nhập số tài khoản',
              hintStyle: context.theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Chủ Tài Khoản',
            style: Get.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.nameEditController,
            validator: (value) {
              if (value!.isEmpty) {
                return value.checkEmpty(ErrorAndIsEmtys.name);
              }
              return null;
            },
            style: context.theme.textTheme.bodyMedium?.copyWith(
                // color: context.theme.hintColor,
                ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: 'Nhập họ tên',
              hintStyle: context.theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Bằng việc liên kết, Bạn sẽ đồng ý với',
                  style: Get.theme.textTheme.bodySmall?.copyWith(),
                ),
                TextSpan(
                  text: ' Điều Khoản và Chính sách sử dụng ',
                  style: Get.theme.textTheme.bodyMedium
                      ?.copyWith(color: Colors.redAccent),
                ),
                TextSpan(
                  text: 'của $text',
                  style: Get.theme.textTheme.bodySmall?.copyWith(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: Get.width,
            child: GestureDetector(
              onTap: () => controller.sendBankLink(
                itemBank: PutAddCardBody(
                  bankId: bankId,
                  accountName: controller.nameEditController.text.trim(),
                  accountNumber: controller.stkEditController.text.trim(),
                ),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Liên Kết',
                      style: Get.theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
