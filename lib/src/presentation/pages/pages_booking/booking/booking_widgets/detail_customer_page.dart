import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCustomerPage extends StatelessWidget {
  static const String routeName = '/DetailCustomerPage';
  const DetailCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (controller) => Container(
        width: Get.width,
        height: Get.height,
        color: Colors.grey[50],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.checkLoginController.isLogin.value == false
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              'Đăng nhập để đặt nhanh Hơn!',
                              style: Get.textTheme.bodyMedium!.copyWith(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InkWell(
                              onTap: () => controller.pushLogin(),
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
                                        'Đăng Nhập/Đăng Kí',
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[400],
                          )
                        ],
                      ),
                    )
                  : const SizedBox.shrink()),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Your detail',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Form(
                  key: controller.keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmptys.name);
                          }
                          if (controller.nameEditController.text.length > 30) {
                            return ErrorAndIsEmptys.nameError;
                          }
                          return null;
                        },
                        controller: controller.nameEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Your Name',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Name',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmptys.name);
                          }
                          if (controller.nameEditController.text.length > 30) {
                            return ErrorAndIsEmptys.nameError;
                          }
                          return null;
                        },
                        controller: controller.nameEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Your Name',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Phone',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmptys.phone);
                          }
                          if (!controller.phoneRegex.hasMatch(
                              controller.phoneEditController.text.trim())) {
                            return ErrorAndIsEmptys.phoneError;
                          }
                          return null;
                        },
                        controller: controller.phoneEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Your Phone',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmptys.email);
                          }
                          if (!controller.emailEditController.text
                              .contains('@')) {
                            return ErrorAndIsEmptys.emailWrongFormat;
                          }
                          return null;
                        },
                        controller: controller.emailEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'mail@example.com',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              // const Divider(
              //   color: Colors.grey,
              //   height: 2,
              //   endIndent: 22,
              //   indent: 22,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: RichText(
              //     text: TextSpan(
              //       children: [
              //         TextSpan(
              //           text: 'Attentive: * ',
              //           style: Get.textTheme.bodyLarge!.copyWith(
              //               fontWeight: FontWeight.bold, color: Colors.red),
              //         ),
              //         TextSpan(
              //           text: 'Please check personal information before payment.',
              //           style: Get.textTheme.bodyLarge!.copyWith(),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
