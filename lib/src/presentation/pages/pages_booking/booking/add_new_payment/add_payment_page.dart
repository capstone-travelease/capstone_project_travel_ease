import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/add_new_payment/add_new_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPay extends GetView<AddNewPaymentController> {
  static const String routeName = '/AddPay';
  const AddPay({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Thông Tin Liên Kết",
              style: Get.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Card(
              child: Form(
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
                          return value.checkEmpty(ErrorAndIsEmtys.password);
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
                    SizedBox(
                      width: Get.width,
                      child: GestureDetector(
                        // onTap: () => controller.onSend(),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.redAccent),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Tiếp Tục',
                                style: Get.theme.textTheme.titleMedium
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
