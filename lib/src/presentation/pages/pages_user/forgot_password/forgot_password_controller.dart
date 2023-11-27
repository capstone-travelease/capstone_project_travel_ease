import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassWordController extends GetxController {
  late TextEditingController emailEditController;
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    super.onInit();
  }

  Future<void> sendForgotPass() async {}
}
