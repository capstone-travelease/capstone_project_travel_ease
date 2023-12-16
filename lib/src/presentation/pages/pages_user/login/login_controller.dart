import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/forgot_password/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController;
  late TextEditingController passwordEditController;
  bool isChecked = false;
  final RxBool isLoading = false.obs;
  RxBool showPassword = false.obs;
  final NotificationConfig notificationConfig = Get.find();
  final CheckLoginController checkLoginController = Get.find();
  final keyForm = GlobalKey<FormState>();
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    passwordEditController = TextEditingController(text: 'Anh12345@');
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
    isLoading.call(true);
    try {
      final res = await _userService.loginUser(
          email: emailEditController.text.trim(),
          password: passwordEditController.text.trim());
      if (res != null) {
        await checkLoginController.login(
          userId: res.userId ?? -1,
          token: res.token ?? '',
        );
        Get.back();
      }
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
