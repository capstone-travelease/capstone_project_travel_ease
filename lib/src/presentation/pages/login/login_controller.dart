import 'package:capstone_project_travel_ease/core/constrants/localvariable.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController;
  late TextEditingController passwordEditController;
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  final NotificationConfig notificationConfig = Get.find();
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

  Future login() async {
    final prefs = await SharedPreferences.getInstance();
    Get.toNamed(LoadingPage.routeName);
    try {
      await Future.delayed(const Duration(seconds: 1));
      await prefs.setBool(LocalVariable.isLogin, true);
      Get.offAllNamed(NavigatorMenuPage.routeName);
    } catch (e) {
      Get.back();
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
