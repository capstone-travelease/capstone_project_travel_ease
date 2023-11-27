import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/forgot_password/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController;
  late TextEditingController passwordEditController;
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  final NotificationConfig notificationConfig = Get.find();
  final CheckLoginController checkLoginController = Get.find();
  final keyForm = GlobalKey<FormState>();

  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    passwordEditController = TextEditingController();
    super.onInit();
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  Future<void> onSend() async {
    if (keyForm.currentState!.validate()) {
      login();
      _cleanInput();
    }
  }

  Future<void> getToForgotPassword() async {
    await Get.dialog(const ForgotPassWordPage());
  }

  Future login() async {
    try {
      await checkLoginController.login('Nguyen Xuan Anh');
      Get.back();
    } catch (e) {
      notificationConfig.showSnackBar(
          title: 'Thông báo',
          'Email hoặc Password không đúng.Vui Lòng thử Lại !',
          backgroundColor: Colors.orangeAccent);
    }
    isLoading.call(false);
  }

  void _cleanInput() {
    emailEditController.text = '';
    passwordEditController.text = '';
  }
}
