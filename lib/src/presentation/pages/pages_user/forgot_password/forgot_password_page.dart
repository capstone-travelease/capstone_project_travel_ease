import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassWordPage extends StatelessWidget {
  const ForgotPassWordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPassWordController>(
      init: ForgotPassWordController(),
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            height: Get.height * 0.5,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.close)),
                      Text(
                        'Forgot Password',
                        style: Get.textTheme.titleMedium!.copyWith(),
                      ),
                      const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image.asset(
                      fit: BoxFit.fill,
                      Assets.images.password.path,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(
                    'Please enter your email address and we will help you with this',
                    textAlign: TextAlign.center,
                    style:
                        Get.textTheme.bodyMedium!.copyWith(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return value.checkEmpty(ErrorAndIsEmtys.email);
                        }
                        if (!controller.emailEditController.text
                            .contains('@')) {
                          return ErrorAndIsEmtys.emailWrongFormat;
                        }
                        return null;
                      },
                      controller: controller.emailEditController,
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                          // color: context.theme.hintColor,
                          ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: Colors.redAccent,
                        ),
                        alignLabelWithHint: true,
                        hintText: 'mail@example.com',
                        hintStyle: context.theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey[500]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.sendForgotPass(),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Text(
                          'Send',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
