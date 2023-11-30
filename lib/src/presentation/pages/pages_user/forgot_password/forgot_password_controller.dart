import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassWordController extends GetxController {
  late TextEditingController emailEditController;
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    super.onInit();
  }

  Future<void> sendForgotPass() async {
    Get.dialog(
      DiaLogSuccessful(
        onTap: () => Get.back(),
        text:
            'The password has been sent to your email, please check and log in to place your order.',
      ),
    );
  }
}
