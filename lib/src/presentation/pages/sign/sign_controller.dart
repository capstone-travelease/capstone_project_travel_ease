import 'package:capstone_project_travel_ease/src/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController emailEditController;
  late TextEditingController passwordEditController;
  late TextEditingController confirmPasswordEditController;
  final RegExp phoneRegex = RegExp(r'^([1-9])?\d{10}$');
  final RegExp specialCharsRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  RxBool showConfirmPassword = false.obs;
  final keyForm = GlobalKey<FormState>();
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    passwordEditController = TextEditingController();
    nameEditController = TextEditingController(text: 'anh');
    phoneEditController = TextEditingController(text: '0987654321');
    confirmPasswordEditController = TextEditingController();
    super.onInit();
  }

  void togglePasswordVisibility(int id) {
    if (id == 1) {
      showPassword.toggle();
    } else {
      showConfirmPassword.toggle();
    }
  }

  Future<void> onSend() async {
    if (keyForm.currentState!.validate()) {
      Get.offAllNamed(LoginView.routeName);
      _cleanInput();
    }
  }

  void _cleanInput() {
    nameEditController.text = '';
    phoneEditController.text = '';
    confirmPasswordEditController.text = '';
    emailEditController.text = '';
    passwordEditController.text = '';
  }
}
